Pod::Spec.new do |s|
  s.name             = 'DefaultDict'
  s.version          = '1.0.0'
  s.summary          = 'A Swift microframework for for dictionaries with default values.'
  s.description      = <<-DESC
DefaultDict is a simple Swift type representing a dictionary with default values. Similar to python's defaultdict, it allows the user to specify a default value that will be returned when a key not currently in the dictionary is accessed.
                       DESC

  s.homepage         = 'https://github.com/noahsark769/DefaultDict'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Noah Gilmore' => 'noah.w.gilmore@gmail.com' }
  s.source           = { :git => 'https://github.com/noahsark769/DefaultDict.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noahsark769'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DefaultDict/Classes/**/*'
  s.frameworks = 'Foundation'
end
