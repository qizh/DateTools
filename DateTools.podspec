Pod::Spec.new do |s|
  s.name         = 'DateToolsSwift'
  s.version      = '2.0.0-beta.1'
  s.summary      = 'Dates and time made easy in Objective-C'
  s.homepage     = 'https://github.com/MatthewYork/DateTools'

  s.description  = 'DateTools was written to streamline date and time handling in Objective-C.'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Matthew York" => "my3681@gmail.com" }

  s.source       = { :git => "https://github.com/MatthewYork/DateTools.git",
                     :tag => "#{s.version.to_s}" }

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'DateTools'
  s.resources    = 'DateTools/DateTools.bundle'
end
