#
#  Be sure to run `pod spec lint AUUKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "AUUKit"
  s.version      = "1.2"
  s.summary      = "AUUKit for kit handle"
  s.homepage     = "https://github.com/JyHu/AUUKit"
  s.license      = "MIT"
  s.author             = { "JyHu" => "auu.aug@gmail.com" }
  s.source       = { :git => "https://github.com/JyHu/AUUKit.git", :commit => "eb2100389e344557a8991cba7258714864203a90" }
  s.source_files  = 'AUUKitContainer/AUUKit/**/*.{h,m}'
  s.requires_arc = true

end
