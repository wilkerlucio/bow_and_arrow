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
      
      def initialize *args
        super *args
        
        @alive = true
        
        @width = 39
        @height = 25
      end
      
      add_state :floating do |elapsed|
        @y -= 60 * elapsed
        @y = app.height if @y + @height < 0
        
        draw_image "ballon.png"
      end
      
      add_state :falling do |elapsed|
        @y += 60 * elapsed
        
        draw_image "ballon_dead.png", 7
        
        @discard = true if @y > app.height
      end
      
      def hit
        @alive = false
        
        @current_state = :falling
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