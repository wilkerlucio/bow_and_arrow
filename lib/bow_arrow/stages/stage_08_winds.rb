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
    class Stage08Winds < Attackers
      def attacker_setup
        @enemy_class = Wind
        
        @briefing = <<EOF
Cauting with the wind!
He can cut your head off!
EOF
        
        @fail = "You lose your head..."
        
        @enemies_left = 250
        @frequency = 0.035
        @frequency_speed = 0.0035
      end
      
      def customize_enemy(enemy)
        enemy.bounce += (@game.level - 1) * enemy.bounce * 0.5
        enemy.bounce_speed += (@game.level - 1) * enemy.bounce_speed * 0.5
      end
    end
  end
end