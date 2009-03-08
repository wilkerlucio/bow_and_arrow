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
    class Arrow < Base
      def initialize *args
        super *args
        
        @width = 51
        @height = 5
      end
      
      def draw elapsed
        @x += 300 * elapsed
        
        draw_image "arrow.png"
      end
      
      def dead?
        @x > app.width
      end
      
      def collision_bounds
        {
          :left   => @x + 49,
          :top    => @y + 2,
          :right  => @x + 51,
          :bottom => @y + 3,    
        }
      end
    end
  end
end