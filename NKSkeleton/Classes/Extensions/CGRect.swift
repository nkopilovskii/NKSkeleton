//
//  Created by Nick Kopilovskii 
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import CoreGraphics

extension CGRect {
  
  static func gradientFrame(type: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition, in bounds: CGRect) -> CGRect {
    
    let size = type == .axial ? bounds.size : CGSize(width: max(bounds.width, bounds.height), height: max(bounds.width, bounds.height))
    var origin = CGPoint.zero
    
    switch type {
    case .radial: origin = CGPoint.radialGradientFrameOrigin(for: initialPosition, in: bounds)
    default: break
    }
    
    return CGRect(origin: origin, size: size)
  }
  
  
  
}
