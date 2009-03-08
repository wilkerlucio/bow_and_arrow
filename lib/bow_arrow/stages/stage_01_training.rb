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
    class Stage01Training < Base
      def start_level
        @briefing = <<EOF
Ruby Bow and Arrow

This game is a remake of
the old win95 bow and arrow
game

made by
Wilker Lucio
EOF
        
        15.times do |i|
          ballon = Ballon.new app
          ballon.x = 250 + ballon.width * i
          ballon.y = app.height - ballon.height

          @enemies << ballon
        end
      end
    end
  end
end