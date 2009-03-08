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
    class Stage02MoreTraining < Base
      def start_level
        @briefing = <<EOF
Ok, you got the basics
Now let's shot at more ballons
EOF
        
        15.times do
          ballon = Ballon.new app
          ballon.x = 250 + rand(300)
          ballon.y = app.height - (rand 400) - ballon.height

          @enemies << ballon
        end
        
        5.times do |i|
          ballon = BallonYellow.new app
          ballon.x = 250 + rand(300)
          ballon.y = app.height - (rand 400) - ballon.height

          @enemies << ballon
        end
      end
    end
  end
end