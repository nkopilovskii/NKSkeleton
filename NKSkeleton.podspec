#
# Be sure to run `pod lib lint NKSkeleton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKSkeleton'
  s.version          = '0.1.0'
  s.summary          = 'Visual component for hiding subviews for the period of loading content'

  s.description      = <<-DESC
  This module allows you to impose a mask on the display for the period of loading content.
  Advanced features allow you to set the level of subview relative to the parent view (to which the module is applied), colors, type and animation of the gradient, with the ability to control the speed of its running.
  
  This module provides a simple implementation of a variety of design solutions for visual components with loadable content.
                       DESC

  s.homepage         = 'https://github.com/nkopilovskii/NKSkeleton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nkopilovskii' => 'nkopilovskii@gmail.com' }
  s.source           = { :git => 'https://github.com/nkopilovskii/NKSkeleton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MKopilovskii'

  s.ios.deployment_target = '10.0'
  s.swift_version  = '4.2'
  #s.source_files = 'NKSkeleton/Classes/**/*'
  s.source_files = 'NKSkeleton/**'
  
end
