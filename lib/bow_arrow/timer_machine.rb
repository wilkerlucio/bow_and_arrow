# Copyright 2009 Wilker Lucio <wilkerlucio@gmail.com>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module BowArrow
  module TimerMachine
    class Timer
      def initialize(time, repeat = 1, &block)
        @time = time
        @repeat = repeat
        @block = block
        
        @elapsed = 0.0
        @executions = 0
        @run = true
      end
      
      def update(elapsed)
        @elapsed += elapsed
        
        while run?
          @elapsed -= @time
          @executions += 1
          
          @block.call
        end
      end
      
      def kill
        @run = false
      end
      
      def discard?
        @run == false or (@repeat != 0 and @repeat == @executions)
      end
      
      private
      
      def run?
        @elapsed >= @time and !discard?
      end
    end
    
    def add_timer *args, &block
      timer = Timer.new(*args, &block)
      
      self.timers << timer
      
      timer
    end
    
    def timers
      @timers ||= []
    end
    
    def update_timers(elapsed)
      self.timers.each do |timer|
        timer.update elapsed
      end
      
      @timers.reject! { |timer| timer.discard? }
    end
    
    def self.included(base)
      #automatic hook draw if the class contains this method
      if base.method_defined? :draw
        base.class_eval do
          alias :timer_old_draw :draw
          
          def draw(elapsed)
            update_timers elapsed
            
            timer_old_draw elapsed
          end
        end
      end
    end
  end
end