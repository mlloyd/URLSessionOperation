Pod::Spec.new do |s|

  s.name         = "URLSessionOperation"
  s.version      = "1.0.0"
  s.summary      = "URLSession + NSOperation wrapper"

  s.description  = "URLSession + NSOperation wrapper"

  s.homepage     = "https://github.com/mlloyd/URLSessionOperation"
  s.license      = { :type => 'MIT' }
  s.authors      = { "Martin Lloyd" => "mlloydy@gmail.com" }
  
  s.source_files  = 'URLSessionOperation/URLSessionOperation.swift'

  s.requires_arc = true

end