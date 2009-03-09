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
    class Slime < LeftMover
      def initialize *args
        super *args
        
        @width = 39
        @height = 49
        
        @speed = 50
      end
      
      def draw_alive elapsed
        draw_image "slime.png"
      end
      
      def draw_dead elapsed
        draw_image "slime_dead.png"
      end
    end
  end
end