# Copyright 2011 NexR
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

 
stopifnot(require(RHive, quietly=TRUE))
stopifnot(require(RUnit, quietly=TRUE))

test.rhive.load.table <- function()
{
  ## Load emp test data and put it into the Hive
  data(emp)

  if(rhive.exist.table("emp")) {
    rhive.drop.table("emp")
  }

  rhive.write.table(emp,"emp")

  queryResult <- rhive.load.table("emp")
  checkTrue(!is.null(queryResult))

  queryResult <- rhive.load.table2("emp")
  checkTrue(!is.null(queryResult))

  if(rhive.exist.table("emp")) {
    rhive.drop.table("emp")
  }
}
