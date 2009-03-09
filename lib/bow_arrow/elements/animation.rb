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
    class Animation
      include TimerMachine
      
      def initialize element, images, frame_rate
        @element = element
        @images = images
        @frame_rate = frame_rate
        @current = 0
        
        add_timer 0.2, 0 do
          @current += 1
          @current = 0 if @current == @images.length
        end
      end
      
      def draw elapsed
        update_timers elapsed
        
        @element.draw_image @images[@current]
      end
    end
  end
end