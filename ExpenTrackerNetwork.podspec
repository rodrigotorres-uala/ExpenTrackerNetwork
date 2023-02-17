#
# Be sure to run `pod lib lint ExpenTrackerNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ExpenTrackerNetwork'
  s.version          = '0.1.0'
  s.swift_version    = '5.4'
  s.summary          = 'A short description of ExpenTrackerNetwork.'

  s.description      = "Description"

  s.homepage         = 'https://github.com/rodrigotorres-uala/ExpenTrackerNetwork'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rodrigotorres-uala' => 'rodrigo.torres@uala.com.ar' }
  s.source           = { :git => 'https://github.com/rodrigotorres-uala/ExpenTrackerNetwork.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'ExpenTrackerNetwork/Classes/**/*'
  
end
