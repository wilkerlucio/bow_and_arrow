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
    class Wind < LeftMover
      attr_accessor :bounce, :bounce_speed
      
      def initialize *args
        super *args
        
        @width = 30
        @height = 32
        
        @bounce = 20
        @bounce_acc = 0
        
        @bounce_speed = 3
        
        @speed = 100
        @animation = Animation.new self, ["wind1.png", "wind2.png"], 0.2
      end
      
      def base_y
        @base_y ||= @y
      end
      
      alias :old_move :move
      
      def move elapsed
        old_move elapsed
        
        @bounce_acc += elapsed * @bounce_speed
        
        @y = base_y + Math.sin(@bounce_acc) * @bounce
      end
      
      def draw_alive elapsed
        @animation.draw elapsed
      end
      
      def draw_dead elapsed
        draw_image "wind_dead.png", -4
      end
    end
  end
end