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
  module Stages
    class Base
      attr_reader :game
      
      def initialize(game)
        @game = game
        
        @hero = Hero.new app
        @enemies = []
      end
      
      def app
        @game.app
      end
      
      def draw elapsed
        app.background app.rgb(0, 128, 0)
        
        @hero.draw elapsed
        
        @enemies.each do |enemy|
          @hero.arrows.each do |arrow|
            if arrow & enemy
              enemy.hit
            end
          end
          
          enemy.draw elapsed
        end
        
        @enemies.reject! { |e| e.dead? }
        
        if @enemies.length == 0
          win
        end
        
        if @hero.lives == 0
          lose
        end
      end
      
      def win
        
      end
      
      def lose
        
      end
    end
  end
end