platform :ios, '8.0'
inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

workspace 'Pook'


target 'PooKit' do
    pod 'ASValueTrackingSlider',    '~> 0.12.1'
    pod 'FDFullscreenPopGesture',   '~> 1.1'
    pod 'RNCryptor',                '~> 5.0.1'
end


target 'Pook' do
    pod 'PooKit',       :path => '.'
    pod 'Alamofire',    '~> 4.2.0'
    pod 'Kingfisher',   '~> 3.10.3'
    pod 'SnapKit',      '~> 3.2.0'
    pod 'PullToRefresher', '~> 2.0'
end
