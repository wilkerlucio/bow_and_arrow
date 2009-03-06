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

module BowArrow
	class Base
		include BowArrow::Elements
	  
	  SCREEN_WIDTH  = 640
		SCREEN_HEIGHT = 480
		
		def initialize(app)
			@app = app
			@hero = Hero.new app
		end
		
		def game_loop
			@app.clear do
				@app.background @app.rgb(0, 128, 0)
				@hero.draw
			end
		end
	end
end