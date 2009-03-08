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
    class Butterfly < Base
      include StateMachine
      
      add_state :stand do |elapsed|
        if @y < 0
          @y = 0
          @direction = 1
        end
        
        if @y + height > app.height
          @y = app.height - @height
          @direction = -1
        end
        
        @y += 50 * @direction * elapsed
        
        draw_image "butterfly_bubled.png"
      end
      
      add_state :free do |elapsed|
        @x -= 30 * elapsed
        @y -= 30 * elapsed
        
        draw_image "butterfly.png", 2, 11
        
        @discard = true if @x + @width < 0 or @y + @height < 0
      end
      
      def initialize *args
        super *args
        
        @alive = true
        
        @width = 30
        @height = 32
        
        @direction = rand(2) == 1 ? 1 : -1
      end
      
      def hit
        @alive = false
        
        @current_state = :free
        
        false
      end
      
      def alive?
        @alive
      end
    end
  end
end