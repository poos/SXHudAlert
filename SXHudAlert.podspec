
Pod::Spec.new do |s|

  s.name         = "SXHudAlert"
  s.version      = "0.0.8"
  s.summary      = "easy useing MBProgressHUD"
  #s.description  = <<-DESC
  #                  DESC

  s.homepage     = "https://github.com/poos/SXHudAlert"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = 'MIT'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "xiaoR" => "bieshixuan@163.com" }
  # Or just: s.author    = "iShown"
  # s.social_media_url   = "http://twitter.com/iShown"

  s.platform     = :ios, "7.1"

  s.source       = { :git => "https://github.com/poos/SXHudAlert.git", :tag => s.version.to_s }
#s.public_header_files = 'Example/SXHelper/SXHelper/SXHelper.h'
  s.source_files  = "SXHudAlert/SXHudAlert.h"
  #s.exclude_files = "Classes/Exclude"


  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "MBProgressHUD", "~> 1.0.0"

  # s.prefix_header_file = 'Example/SXHelper/SXHelper/SXPrefixHeader.pch'

s.subspec 'MainClass' do |ss|
ss.source_files = 'SXHudAlert/**/*.{h,m}'
ss.public_header_files = "SXHudAlert/**/*.h"
s.dependency "MBProgressHUD", "~> 1.0.0"
end

end
