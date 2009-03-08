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
    class Stage04Slimes < Base
      include TimerMachine
      
      def start_level
        @briefing = <<EOF
The slimes are comming!
Don't let their pass!
EOF
        
        @slimes_left = 100
        @frequency = 0.02
        
        add_timer 3, 0 do
          @frequency += 0.002
        end
      end
      
      def stage_loop(elapsed)
        if rand < @frequency
          create_slime
        end
      end
      
      def create_slime
        return if @slimes_left == 0
        
        @slimes_left -= 1
        
        slime = Elements::Slime.new app
        slime.x = app.width
        slime.y = rand(480 - slime.height)
        
        @enemies << slime
      end
      
      def win?
        @slimes_left == 0 and @enemies.length == 0
      end
    end
  end
end