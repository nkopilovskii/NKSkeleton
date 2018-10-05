//
//  NKSkeletonConfiguration.swift
//
//  Created by Nick Kopilovskii on 17.09.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

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
  
  
  public init() { }
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
    
    var radialDirection: Bool {
      switch self {
      case .axial: return true
      case .radial(let val): return val
      }
    }
  }
  
  /**
   Starting (initial) point of the gradient on the `NKSkeleton().sourceView'
   
   In case `NKSkeletonConfiguration().type = .axial' gradient vector will be directed from the selected starting point to the opposite side/corner
   
   In case `NKSkeletonConfiguration().type = .radial(bool)' will be formed as a radial transition between the colors from the starting point in all directions
   */
  public enum NKInitialPosition {
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from left side to right side
    case left
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from right side to left side
    case right
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from top side to bottom side
    case top
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from bottom side to top side
    case bottom
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from top left corner to bottom right corner
    case topLeft
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from top right corner to bottom left corner
    case topRight
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from bottom left corner to top right corner
    case bottomLeft
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from bottom right corner to top left corner
    case bottomRight
    
    /// *if `NKSkeletonConfiguration().type = .axial'* from center to left and right sides
    case center
  }
  
}
