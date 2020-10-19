#
# Be sure to run `pod lib lint Confetto.podspec' to ensure this is a
# valid spec before submitting.
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "Confetto"
  s.version = "0.2.0"
  s.summary = "Confetto! Who doesn't like confetti?'"
  s.description = "Confetto is the quickest way to add confetti to your application and make your users feel rewarded. Forked from ConfettiView"

  s.homepage         = "https://github.com/gordontucker/Confetto"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sudeep Agarwal" => "sudeep135@gmail.com",
                         "Gordon Tucker" => "gordon.michael.tucker@gmail.com"
                       }
  s.source           = { :git => "https://github.com/gordontucker/Confetto.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.swift_version = '5'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = "Pod/Assets/*.png"

  s.frameworks = 'UIKit', 'QuartzCore'
end
