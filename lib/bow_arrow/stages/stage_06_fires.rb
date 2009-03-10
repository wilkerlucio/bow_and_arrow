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
    class Stage06Fires < Attackers
      enemy_class Fire
      
      def attacker_setup
        @briefing = <<EOF
Know let's get a little bit
of dificult

Don't get burned!
EOF
        
        @fail = "I said to you won't get burned..."
        
        @enemies_left = 200
        @frequency = 0.03
        @frequency_speed = 0.003
      end
    end
  end
end