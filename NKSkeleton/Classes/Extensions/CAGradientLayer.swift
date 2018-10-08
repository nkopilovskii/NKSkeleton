//
//  Created by Nick Kopilovskii 
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

extension CAGradientLayer {

  static let kNKSkeletonGradientLayer = "kNKSkeletonGradientLayer"
  
  static func layer(with mask: CALayer, configuration: NKSkeletonConfiguration) -> CAGradientLayer? {
    
    guard !configuration.colors.isEmpty else  { return nil }
    
    let gradient = CAGradientLayer()
    gradient.frame = CGRect.gradientFrame(type: configuration.type, initialPosition: configuration.initialPosition, in: mask.bounds)
    mask.frame = CGRect(origin: CGPoint(x: -gradient.frame.origin.x, y: -gradient.frame.origin.y), size: mask.frame.size)
    gradient.mask = mask
    
    let delta =  configuration.colors.count > 1 ? 1 / Double(configuration.colors.count - 1) : 0

    gradient.colors =  configuration.colors + configuration.colors
    gradient.locations = [NSNumber].initialLocations(for: configuration.type, count: (gradient.colors?.count ?? 1), with: delta)
    
    gradient.startPoint = CGPoint.gradientStartPoint(configuration.initialPosition)
    gradient.endPoint = CGPoint.gradientEndPoint(for: configuration.type, initialPosition: configuration.initialPosition)
    
    gradient.name = kNKSkeletonGradientLayer
    
    if configuration.type != NKSkeletonConfiguration.NKType.axial {
      #warning("Critical issue!!!")
      print("The use of the gradient type '.radial' is not possible in the case of using the library installed through CocoaPods. For using advanced settings, install, follow the instructions in the developer repository https://github.com/nkopilovskii/NKSkeleton.")
    }
    
//    gradient.type = CAGradientLayerType.type(for: configuration.type, initialPosition: configuration.initialPosition)
    
    return gradient
  }
  
  
}

