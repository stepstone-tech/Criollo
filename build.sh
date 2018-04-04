#/bin/bash


# Frameworks Build
xcodebuild clean build -quiet -project Criollo.xcodeproj -scheme "Criollo macOS" CODE_SIGNING_REQUIRED=NO
xcodebuild clean build -quiet -project Criollo.xcodeproj -scheme "Criollo iOS" CODE_SIGNING_REQUIRED=NO
xcodebuild clean build -quiet -project Criollo.xcodeproj -scheme "Criollo tvOS" CODE_SIGNING_REQUIRED=NO

# Frameworks Tests
xcodebuild clean test -quiet -project Criollo.xcodeproj -scheme "Criollo macOS" CODE_SIGNING_REQUIRED=NO
xcodebuild clean test -quiet -destination 'platform=iOS Simulator,name=iPhone X' -project Criollo.xcodeproj -scheme "Criollo iOS" CODE_SIGNING_REQUIRED=NO
xcodebuild clean test -quiet -destination 'platform=tvOS Simulator,name=Apple TV' -project Criollo.xcodeproj -scheme "Criollo tvOS" CODE_SIGNING_REQUIRED=NO

# Apps
xcodebuild clean build -quiet -project Criollo.xcodeproj -scheme "Criollo macOS App" CODE_SIGNING_REQUIRED=NO
xcodebuild clean build -quiet -project Criollo.xcodeproj -destination 'platform=iOS Simulator,name=iPhone X' -scheme "Criollo iOS App" CODE_SIGNING_REQUIRED=NO
xcodebuild clean build -quiet -project Criollo.xcodeproj -destination 'platform=tvOS Simulator,name=Apple TV' -scheme "Criollo tvOS App" CODE_SIGNING_REQUIRED=NO

# Update cocoapods master repo
pod repo update

# Examples
cd Examples

cd HelloWorld
pod install && xcodebuild clean build -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld" CODE_SIGNING_REQUIRED=NO
cd ../

cd HelloWorld-MultiTarget
pod install && xcodebuild clean build -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld" CODE_SIGNING_REQUIRED=NO
pod install && xcodebuild clean build -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld-Cocoa" CODE_SIGNING_REQUIRED=NO
pod install && xcodebuild clean build -quiet -destination 'platform=iOS Simulator,name=iPhone X' -workspace HelloWorld.xcworkspace -scheme "HelloWorld-iOS" CODE_SIGNING_REQUIRED=NO
pod install && xcodebuild clean build -quiet -destination 'platform=tvOS Simulator,name=Apple TV' -workspace HelloWorld.xcworkspace -scheme "HelloWorld-tvOS" CODE_SIGNING_REQUIRED=NO
cd ../

cd HelloWorld-ObjC
pod install && xcodebuild clean build -quiet -workspace HelloWorld-ObjC.xcworkspace -scheme "HelloWorld-ObjC" CODE_SIGNING_REQUIRED=NO
cd ../

cd HelloWorld-Swift
pod install && xcodebuild clean build -quiet -workspace HelloWorld-Swift.xcworkspace -scheme "HelloWorld-Swift" CODE_SIGNING_REQUIRED=NO
cd ../

cd LongRequest
pod install && xcodebuild clean build -quiet -workspace LongRequest.xcworkspace -scheme "LongRequest" CODE_SIGNING_REQUIRED=NO
cd ../

cd SecureHTTPServer
pod install && xcodebuild clean build -quiet -destination 'platform=iOS Simulator,name=iPhone X' -workspace SecureHTTPServer.xcworkspace -scheme "SecureHTTPServer" CODE_SIGNING_REQUIRED=NO
cd ../

cd ServerStats
pod install && xcodebuild clean build -quiet -workspace CriolloServerStats.xcworkspace -scheme "CriolloServerStats" CODE_SIGNING_REQUIRED=NO
cd ../

cd ../