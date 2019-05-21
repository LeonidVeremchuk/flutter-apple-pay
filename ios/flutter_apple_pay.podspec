#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_apple_pay'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Apple Pay'
  s.description      = <<-DESC
Flutter Apple Pay
                       DESC
  s.homepage         = 'https://github.com/Snailapp'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Snailapp' => 'leonid.veremchuk@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Stripe'
  
  s.ios.deployment_target = '11.0'
end

