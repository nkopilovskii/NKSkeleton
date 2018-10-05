//
//  Created by Nick Kopilovskii 
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import CoreGraphics

extension CGPoint {
  
  static func gradientStartPoint(_ initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGPoint {
    return CGPoint(x: startX(initialPosition), y: startY(initialPosition))
  }
  
  static func gradientEndPoint(for type: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGPoint {
    return CGPoint(x: CGPoint.endX(for: type, initialPosition: initialPosition), y: CGPoint.endY(for: type, initialPosition: initialPosition))
  }
  
  static func radialGradientFrameOrigin(for initialPosition: NKSkeletonConfiguration.NKInitialPosition, in bounds: CGRect) -> CGPoint {
    
    let side =  max(bounds.width, bounds.height)
    let x = CGPoint.radialGradientFrameOriginX(for: initialPosition, wight: side, in: bounds)
    let y = CGPoint.radialGradientFrameOriginY(for: initialPosition, height: side, in: bounds)
    
    return CGPoint(x: x, y: y)
  }
  
}


fileprivate extension CGPoint {
  
  static func startX(_ initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGFloat {
    switch initialPosition {
    case .left, .topLeft, .bottomLeft: return 0
    case .right, .topRight, .bottomRight: return 1
    case .top, .bottom, .center: return 0.5
    }
  }
  
  static func startY(_ initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGFloat {
    switch initialPosition {
    case .topLeft, .top, .topRight: return 0
    case .bottomLeft, .bottom, .bottomRight: return 1
    case .left, .right, .center: return 0.5
    }
  }
  
  static func endX(for type: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGFloat {
    
    switch initialPosition {
    case .center: return type == .axial ? 1 : CGPoint.startX(initialPosition) + 1
    default: return type == NKSkeletonConfiguration.NKType.axial ? abs(CGPoint.startX(initialPosition) - 1) : CGPoint.startX(initialPosition) + 1
    }
  }
  
  static func endY(for type: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> CGFloat {
    
    switch initialPosition {
    case .center: return type == NKSkeletonConfiguration.NKType.axial ? 0.5 : 1.5
    default: return type == NKSkeletonConfiguration.NKType.axial ? abs(CGPoint.startY(initialPosition) - 1) : CGPoint.startY(initialPosition) + 1
    }
    
  }
  
}


fileprivate extension CGPoint {

  static func radialGradientFrameOriginX(for initialPosition: NKSkeletonConfiguration.NKInitialPosition, wight: CGFloat,  in bounds: CGRect) -> CGFloat {
    switch initialPosition {
    case .topLeft, .left, .bottomLeft: return 0
    case .top, .center, .bottom: return (bounds.width - wight) / 2
    case .topRight, .right, .bottomRight: return bounds.width - wight
    }
  }
  
  static func radialGradientFrameOriginY(for initialPosition: NKSkeletonConfiguration.NKInitialPosition, height: CGFloat,  in bounds: CGRect) -> CGFloat {
    switch initialPosition {
    case .topLeft, .top, .topRight: return 0
    case .left, .center, .right: return (bounds.height - height) / 2
    case .bottomLeft, .bottom, .bottomRight: return bounds.height - height
    }
  }
  
}
