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
    class Stage04Slimes < Attackers
      enemy_class Slime
      
      def attacker_setup
        @briefing = <<EOF
The slimes are comming!
Don't let their pass!
EOF
        
        @fail = "You have been swallowed..."
        
        @enemies_left = 100
        @frequency = 0.02
        @frequency_speed = 0.002
      end
    end
  end
end