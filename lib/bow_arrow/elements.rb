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
    SPRITES_BASE = "sprites"
  end
end

require 'lib/bow_arrow/elements/base'
require 'lib/bow_arrow/elements/collection'
require 'lib/bow_arrow/elements/state_machine'

require 'lib/bow_arrow/elements/hero'
require 'lib/bow_arrow/elements/arrow'
require 'lib/bow_arrow/elements/ballon'
require 'lib/bow_arrow/elements/ballon_yellow'
require 'lib/bow_arrow/elements/score'
require 'lib/bow_arrow/elements/paper'
require 'lib/bow_arrow/elements/slime'