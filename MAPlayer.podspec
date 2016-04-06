#
# Be sure to run `pod lib lint MAPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "MAPlayer"
s.version          = "0.0.1"
s.summary          = "简单的在线播放器，可后台播放，支持MPNowPlayingInfoCenter."

s.description      = <<-DESC
"简单的在线播放器，可后台播放，支持MPNowPlayingInfoCenter.注: MPNowPlayingInfoCenter功能需在真机上测试，模拟器上好像有bug支持的不是很好"
DESC

s.homepage         = "https://github.com/fengyunjue/MAPlayer"
s.license          = 'MIT'
s.author           = { "ma772528138" => "ma772528138@qq.com" }
s.source           = { :git => "https://github.com/fengyunjue/MAPlayer.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'MAPlayer/*.{h,m}'
s.public_header_files = 'MAPlayer/*.h'
s.frameworks = 'AVFoundation'

end
