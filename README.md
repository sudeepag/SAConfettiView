# SAConfettiView

![language](https://img.shields.io/badge/Language-%20Swift%20-orange.svg)
![CI Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)
[![License](https://img.shields.io/cocoapods/l/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)
[![Platform](https://img.shields.io/cocoapods/p/SAConfettiView.svg?style=flat)](http://cocoapods.org/pods/SAConfettiView)

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/11940172/11791210/f97b6bd8-a2da-11e5-9083-b131fa796373.gif" alt="confetti" width="473.6" height="198">
</p>

It's raining confetti! SAConfettiView is the easiest way to add fun, multi-colored confetti to your application and make users feel rewarded. Written in Swift, SAConfettiView is a subclass of UIView and is highly customizable. From various types and colors of confetti to different levels of intensity, you can make the confetti as fancy as you want.

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

Don't forget to add the subview!

```swift
self.view.addSubview(confettiView)
```

### Types

Pick one of the preconfigured types of confetti with the `.type` property, or create your own by providing a custom image. This property defaults to the `.Confetti` type.

##### `.Confetti`

![confetti](https://cloud.githubusercontent.com/assets/11940172/11819440/c9db329e-a39a-11e5-9284-b0171bee0f24.gif)

```swift
confettiView.type = .Confetti
```

##### `.Triangle`

![triangle](https://cloud.githubusercontent.com/assets/11940172/11819211/9b8b758a-a399-11e5-8ed3-2eb92f633628.gif)

```swift
confettiView.type = .Triangle
```

##### `.Star`

![star](https://cloud.githubusercontent.com/assets/11940172/11819401/90a2188a-a39a-11e5-8a03-ddca3fb52e72.gif)

```swift
confettiView.type = .Star
```

##### `.Diamond`

![diamond](https://cloud.githubusercontent.com/assets/11940172/11819275/f1c83c08-a399-11e5-8d40-85e9a1879526.gif)

```swift
confettiView.type = .Diamond
```

##### `.Image`

![image](https://cloud.githubusercontent.com/assets/11940172/11819363/5f4f0dba-a39a-11e5-826b-d198113f50dd.gif)

```swift
confettiView.type = .Image(UIImage(named: "smiley"))
```

### Colors

Set the colors of the confetti with the `.colors` property. This property has a default value of multiple colors. 

``` swift
confettiView.colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]
```

### Intensity

The intensity refers to how many particles are generated and how quickly they fall. Set the intensity of the confetti with the `.intensity` property by passing in a value between 0 and 1. The default intensity is 0.5.

``` swift
confettiView.intensity = 0.75
```

### Starting

To start the confetti, use

``` swift
confettiView.startConfetti()
```

### Stopping

To stop the confetti, use

``` swift
confettiView.stopConfetti()
```

## Change Log

### 1.0.7
* Use view's `width` property instead of `center` to fix bug in UIScrollView
  [debug29](https://github.com/debug29)
  [#4](https://github.com/sudeepag/SAConfettiView/issues/4)

### 1.0.6
* Prevent error when calling `.stopConfetti()` before `.startConfetti()`
  [ahmads](https://github.com/ahmads)
  [#7](https://github.com/sudeepag/SAConfettiView/pull/7)

### 1.0.5
* Add Storyboard support
  [SlaunchaMan](https://github.com/SlaunchaMan)
  [#1](https://github.com/sudeepag/SAConfettiView/pull/1)

### 1.0.4
* Replace `.Custom` with `.Image(UIImage)` for easier customization of confetti image
  [gmertk](https://github.com/gmertk)
  [#2](https://github.com/sudeepag/SAConfettiView/pull/2)

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
