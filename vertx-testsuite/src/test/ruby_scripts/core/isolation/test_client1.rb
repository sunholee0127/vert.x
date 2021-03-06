# Copyright 2011-2012 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "vertx"
include Vertx
require "test_utils"

@tu = TestUtils.new

def test_isolated_global_init1
  $test_global = 1
  puts "set to 1"
  @tu.test_complete
end

def test_isolated_global
  puts "global is #{$test_global}"
  @tu.azzert($test_global == 1)
end

def vertx_stop
  @tu.unregister_all
  @tu.app_stopped
end

$test_global = nil
@tu.register_all(self)
@tu.app_ready

