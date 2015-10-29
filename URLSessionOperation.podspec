Pod::Spec.new do |s|

  s.name         = 'URLSessionOperation'
  s.version      = '1.0.1'
  s.summary      = 'URLSession + NSOperation wrapper'

  s.description  = 'Is a URLSession + NSOperation wrapper'

  s.homepage     = 'https://github.com/mlloyd/URLSessionOperation'
  s.license      = { :type => 'Apache License, Version 2.0', :text =>
    'Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.'
  }
  s.authors      = { 'Martin Lloyd' => 'mlloydy@gmail.com' }
  
  s.source       = { :git => 'https://github.com/mlloyd/URLSessionOperation.git', :tag => s.version.to_s }
  s.source_files  = 'URLSessionOperation/**/*.swift'

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"

  s.requires_arc = 'true'

end
