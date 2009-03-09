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
  module Elements
    class LeftMover < Base
      include StateMachine
      include TimerMachine
      
      attr_accessor :speed
      
      def self.inherited(base)
        base.add_state :stand do |elapsed|
          move elapsed
          draw_alive elapsed
          
          @discard = true if @x + @width < 0
        end
        
        base.add_state :dead do |elapsed|
          @x -= 10 * elapsed
          
          draw_dead elapsed
        end
      end
      
      def move elapsed
        @x -= @speed * elapsed
      end
      
      def draw_alive elapsed
        
      end
      
      def draw_dead elapsed
        
      end
      
      def initialize *args
        super *args
        
        @alive = true
        
        @speed = 0
      end
      
      def hit
        @alive = false
        
        @current_state = :dead
        
        add_timer 0.6 do
          @discard = true
        end
        
        true
      end
      
      def alive?
        @alive
      end
    end
  end
end