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

require 'lib/bow_arrow/elements'
require 'lib/bow_arrow/stages'

module BowArrow
  class Base
    include BowArrow::Elements
    
    attr_reader :app, :score
    
    SCREEN_WIDTH  = 640
    SCREEN_HEIGHT = 480
    
    STAGES = [
      Stages::Stage01Training,
      Stages::Stage02MoreTraining,
      Stages::Stage03Butterflies,
      Stages::Stage04Slimes
    ]
    
    def initialize(app)
      @app = app
      @score = Score.new @app
      
      @cur_stage = -1
      
      self.next
    end
    
    def game_loop(elapsed)
      @app.clear do
        @stage.draw elapsed
      end
    end
    
    def next
      @cur_stage += 1 unless @cur_stage + 1 == STAGES.length
      
      @stage = STAGES[@cur_stage].new self
    end
  end
end