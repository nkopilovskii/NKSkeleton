# NKSkeleton

![Swift](https://img.shields.io/badge/Swift-4.2-red.svg)  [![Version](https://img.shields.io/cocoapods/v/NKSkeleton?style=flat)](https://cocoapods.org/pods/NKSkeleton) [![License](https://img.shields.io/cocoapods/l/NKSkeleton?style=flat)](https://cocoapods.org/pods/NKSkeleton) [![Platform](https://img.shields.io/cocoapods/p/NKSkeleton?style=flat)](https://cocoapods.org/pods/NKSkeleton)

## Crytical issue

## Interface

### NKSkeleton
```swift
public class NKSkeleton {

  public init(configuration: NKSkeletonConfiguration, sourceView: UIView? = nil) 

  /**
    Show skeleton on `sourceView`
  */
  public func show(on sourceView: UIView? = nil) 

  /**
    Hide skeleton on `sourceView`
  */
  public func remove() 

}
```

### NKSkeletonConfiguration
```swift
public struct NKSkeletonConfiguration {

  /// The parameter indicates the need to play animation
  public var isAnimatable = false

  /// Sequence of colors to display the gradient
  public var colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor]

  /// Gradient display type
  public var type: NKType = .axial

  /// The position of the beginning of the gradient vector
  public var initialPosition: NKInitialPosition = .topLeft

  /// The duration of one pass animation
  public var speed: CFTimeInterval = 0

  /// The level of subviews to be hidden by the skeleton, relative to the parent view
  public var subviewsLevel = 0

  public init()

}

public extension NKSkeletonConfiguration {

  /// Skeleton gradient type
  public enum NKType: Equatable {

    /**
      Using the parameter `.axial` gradient will be formed as a linear transition between the colors along the gradient vector
    */
    case axial

    /**
      Using the parameter `.radial(Bool)` gradient will be formed as a radial transition between the colors from the starting point in all directions

      The passed `Bool` parameter is responsible for the direction of the animation.
      If `NKSkeletonConfiguration().isAnimatable = false` passed `Bool` parameter value will be ignored.

      If passed `Bool` parameter is `true` animation will move from `NKSkeletonConfiguration().initialPosition' in all directions, else - from all directions to `NKSkeletonConfiguration().initialPosition'
    */
    case radial(Bool)

  }


  /**
  Starting (initial) point of the gradient on the `NKSkeleton().sourceView'

  In case `NKSkeletonConfiguration().type = .axial' gradient vector will be directed from the selected starting point to the opposite side/corner

  In case `NKSkeletonConfiguration().type = .radial(bool)' will be formed as a radial transition between the colors from the starting point in all directions
  */
  public enum NKInitialPosition {

    /// <if `NKSkeletonConfiguration().type = .axial'> from left side to right side
    case left

    /// <if `NKSkeletonConfiguration().type = .axial'> from right side to left side
    case right

    /// <if `NKSkeletonConfiguration().type = .axial'> from top side to bottom side
    case top

    /// <if `NKSkeletonConfiguration().type = .axial'> from bottom side to top side
    case bottom

    /// <if `NKSkeletonConfiguration().type = .axial'> from top left corner to bottom right corner
    case topLeft

    /// <if `NKSkeletonConfiguration().type = .axial'> from top right corner to bottom left corner
    case topRight

    /// <if `NKSkeletonConfiguration().type = .axial'> from bottom left corner to top right corner
    case bottomLeft

    /// <if `NKSkeletonConfiguration().type = .axial'> from bottom right corner to top left corner
    case bottomRight

    /// <if `NKSkeletonConfiguration().type = .axial'> from center to left and right sides
    case center
  }

}

```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NKSkeleton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NKSkeleton'
```
For using advanced settings add the following line to your Podfile:

```ruby
pod 'NKSkeleton', :git => 'https://github.com/nkopilovskii/NKSkeleton.git', :branch => 'advanced'
```


## Author

nkopilovskii, nkopilovskii@gmail.com

## License

NKSkeleton is available under the MIT license. See the LICENSE file for more info.
