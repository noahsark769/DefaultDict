# DefaultDict

[![CI Status](http://img.shields.io/travis/noahsark769/DefaultDict.svg?style=flat)](https://travis-ci.org/noahsark769/DefaultDict)
[![Version](https://img.shields.io/cocoapods/v/DefaultDict.svg?style=flat)](http://cocoapods.org/pods/DefaultDict)
[![License](https://img.shields.io/cocoapods/l/DefaultDict.svg?style=flat)](http://cocoapods.org/pods/DefaultDict)
[![Platform](https://img.shields.io/cocoapods/p/DefaultDict.svg?style=flat)](http://cocoapods.org/pods/DefaultDict)

## Usage

```swift
import DefaultDict

let d = DefaultDict<String: String>(value: "default")
print(d["something"]) // prints "default"
d["something"] = "other"
print(d["something"]) // prints "other"
```

## Installation

DefaultDict is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DefaultDict', '~> 1.0.0'
```

## Development and contributing

Contributions are welcome! Please open an issue to suggest a feature (you can assign yourself if you intent to implement it).

To run tests, run `pod install` on the `Example` project and open the example workspace where you'll find the tests.

## Author

Noah Gilmore, noahgilmore.com

## License

DefaultDict is available under the MIT license. See the LICENSE file for more info.
