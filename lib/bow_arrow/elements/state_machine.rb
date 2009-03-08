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
    module StateMachine
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        attr_accessor :states, :default_state
        
        def add_state(name, &block)
          @states ||= {}
          
          method_name = "_state_#{name}"
          
          define_method method_name, &block
          
          @states[name] = method_name
          
          @default_state ||= name
        end
        
        def states
          @states ||= {}
        end
      end
      
      attr_accessor :current_state
      
      def current_state
        @current_state ||= self.class.default_state
      end
      
      def state
        self.class.states[self.current_state]
      end
      
      def draw elapsed
        self.send(state, elapsed) if respond_to? state
      end
    end
  end
end
