# SAConfettiView

![language](https://img.shields.io/badge/Language-%20Swift%20-orange.svg)
![CI Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)
[![License](https://img.shields.io/cocoapods/l/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)
[![Platform](https://img.shields.io/cocoapods/p/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/11940172/11791210/f97b6bd8-a2da-11e5-9083-b131fa796373.gif" alt="confetti" width="473.6" height="198">
</p>

It's raining confetti! SAConfettiView is the quickest way to add confetti to your application and make users feel rewarded. Written in Swift, SAConfettiView is a subclass of UIView and can be customized for different colors and levels of intensity. 

## Installation

SAConfettiView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod "SAConfettiView"
```

And then run:

`$ pod install`

#### Manual Installation
To manually install SAConfettiView, simply add `SAConfettiView.swift` to your project.

## Usage

Creating a SAConfettiView is the same as creating a UIView:

```swift
let confettiView = SAConfettiView(frame: self.view.bounds)
```

#### Colors

Set the colors of the confetti with the `.colors` property. The default colors are red, green and blue.

``` swift
confettiView.colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]
```

#### Intensity

The intensity refers to how many particles are generated and how quickly they fall. Set the intensity of the confetti with the `.intensity` property by passing in a value between 0 and 1. The default intensity is 0.5.

``` swift
confettiView.intensity = 0.75
```

#### Starting

To start the confetti, use

``` swift
confettiView.startConfetti()
```

#### Stopping

To stop the confetti, use

``` swift
confettiView.stopConfetti()
```

## License

Copyright (c) 2015 Sudeep Agarwal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
