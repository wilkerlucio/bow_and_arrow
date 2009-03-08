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
    class Ballon < Base
      include StateMachine
      
      attr_accessor :alive
      
      def self.add_states(base)
        base.add_state :floating do |elapsed|
          floating_state elapsed
        end
        
        base.add_state :falling do |elapsed|
          falling_state elapsed
        end
      end
      
      def self.inherited(base)
        add_states base
      end
      
      def initialize *args
        super *args
        
        @alive = true
        
        @width = 25
        @height = 39
        
        @speed_up = 60
        @speed_down = 60
      end
      
      def floating_state elapsed
        @y -= @speed_up * elapsed
        @y = app.height if @y + @height < 0
        
        draw_image image
      end
      
      def falling_state elapsed
        @y += @speed_down * elapsed
        
        draw_image image_dead, 7
        
        @discard = true if @y > app.height
      end

      add_states self
      
      def image
        "ballon.png"
      end
      
      def image_dead
        "ballon_dead.png"
      end
      
      def hit
        @alive = false
        
        @current_state = :falling
        
        false
      end
      
      def alive?
        alive
      end
      
      def collision_bounds
        {
          :left   => @x + 1,
          :top    => @y + 1,
          :right  => @x + 24,
          :bottom => @y + 25,    
        }
      end
    end
  end
end