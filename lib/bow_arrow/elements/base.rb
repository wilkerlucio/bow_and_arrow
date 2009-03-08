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
    class Base
      attr_accessor :x, :y, :width, :height
      attr_reader :app
      
      def initialize(app, options = {})
        @app = app
        @x = 0
        @y = 0
        @width = 0
        @height = 0
        @discard = false
      end
      
      def bounds
        compute_bounds @x, @y, @width, @height
      end
      
      alias :collision_bounds :bounds
      
      def colliding?(other)
        b1, b2 = collision_bounds, other.collision_bounds
        
        return false if b1[:right] < b2[:left]
        return false if b1[:bottom] < b2[:top]
        return false if b1[:left] > b2[:right]
        return false if b1[:top] > b2[:bottom]
        
        true
      end
      
      def self.image_path(path)
        File.join(SPRITES_BASE, path)
      end
      
      def draw elapsed
        # by default, do nothing
      end
      
      def draw_image(path, x_offset = 0, y_offset = 0)
        app.image self.class.image_path(path), :left => @x.round + x_offset, :top => @y.round + y_offset
      end
      
      def &(other)
        colliding? other
      end
      
      def alive?
        true
      end
      
      def dead?
        !alive
      end
      
      def discard?
        @discard
      end
      
      private
      
      def compute_bounds(x, y, width, height)
        {
          :left   => x,
          :top    => y,
          :right  => x + width,
          :bottom => y + height
        }
      end
    end
  end
end