Pod::Spec.new do |s|
  s.name             = 'FluterUD'
  s.version          = '0.1.0'
  s.summary          = 'FlutterUD'
 
  s.description      = <<-DESC
FlutterUD module
                       DESC
 
  s.homepage         = 'https://github.com/romanpozd-tg17/flutter_ud'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Roman Pozdnyakov' => 'roman.poz@tg-17.com' }
  s.source           = { :git => 'https://github.com/romanpozd-tg17/flutter_ud', :branch => 'master', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'flutter_ud/'
 
end