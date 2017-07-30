#
#  Be sure to run `pod spec lint Crypt-ObjC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PooKit"
  s.version      = "0.0.9"
  s.summary      = "Pook Reader Kit"
  s.description  = <<-DESC
                    Pook Reader Kit
                   DESC
  s.homepage     = "https://github.com/Chihpin/Pook.git"
  s.license      = "MIT"
  s.author       = { "Chihpin" => "" }
  s.platform     = :ios, "8.0"
  # s.source       = { :git => "https://github.com/Chihpin/Pook.git" }
  s.source       = { :path => "." }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  # s.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => 'PookKit/DZMeBookRead-Bridging-Pch.h' } 
  # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  # s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # s.prefix_header_file = 'PooKit/DZMeBookRead-Bridging-Pch.h'
  
  s.default_subspec = 'All'
  s.subspec 'All' do |spec|
    s.source_files = [
      'PooKit/*.{h,m,swift}'
    ]
    s.public_header_files = [
      'PooKit/*.{h}'
    ]
    s.resources = ['PooKit/Assets/*.png']
    spec.dependency 'PooKit/Extension'
    spec.dependency 'PooKit/View'
    spec.dependency 'PooKit/Model'
    spec.dependency 'PooKit/YGPulseView'

    spec.dependency 'RNCryptor', '~> 5.0.1'
    spec.dependency 'ASValueTrackingSlider', '~> 0.12.1'
    spec.dependency 'FDFullscreenPopGesture', '~> 1.1'
  end

  # AES
  s.subspec 'Extension' do |spec|
    spec.source_files = [
      'PooKit/Extension/*.{h,m,swift}'
    ]
    spec.public_header_files = [
      'PooKit/Extension/*.{h}'
    ]
  end

  s.subspec 'View' do |spec|
    spec.source_files = [
      'PooKit/View/*.{h,m,swift}'
    ]
    spec.public_header_files = [
      'PooKit/View/*.{h}'
    ]
  end

  s.subspec 'Model' do |spec|
    spec.source_files = [
      'PooKit/Model/*.{h,m,swift}'
    ]
    spec.public_header_files = [
      'PooKit/Model/*.{h}'
    ]
  end

  s.subspec 'YGPulseView' do |spec|
    spec.source_files = [
      'PooKit/YGPulseView/*.{h,m,swift}'
    ]
    spec.public_header_files = [
      'PooKit/YGPulseView/*.{h}'
    ]
  end
end
