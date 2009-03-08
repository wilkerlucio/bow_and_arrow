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
    class Paper < Base
      attr_accessor :text
      
      def initialize *args
        super *args
        
        @text = ""
        @width = 286
        @height = 220
        
        @x = app.width / 2 - @width / 2
        @y = app.height / 2 - @height / 2
      end
      
      def draw elapsed
        draw_image "paper.png"
        
        app.para @text,
          :left => @x,
          :top => @y + 15,
          :width => @width,
          :align => "center",
          :size => "8px",
          :leading => 1
      end
    end
  end
end