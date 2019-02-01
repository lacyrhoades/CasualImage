Pod::Spec.new do |s|
  s.name             = "CasualImage"
  s.version          = "1.0"
  s.summary          = "Swift types etc. for image-based apps"
  s.homepage         = "http://colordeaf.net"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { "Lacy Rhoades" => "lacy@colordeaf.net" }
  s.source           = { git: "https://github.com/lacyrhoades/CasualImage.git" }
  s.ios.deployment_target = '11.0'
  s.requires_arc = true
  s.ios.source_files = 'Source/**/*.swift'
  s.exclude_files = 'Source/**/*Test.swift'
  s.dependency 'CasualUtility'
end
