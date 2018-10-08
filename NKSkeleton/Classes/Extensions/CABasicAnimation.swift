//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

extension CABasicAnimation {
    
  static func animation(for gradient: CAGradientLayer, config: NKSkeletonConfiguration) -> CABasicAnimation? {
    guard let locations = gradient.locations, locations.count > 1 else { return nil }
    let animation = CABasicAnimation(keyPath: "locations")
    
    let delta = abs(locations[0].doubleValue - locations[1].doubleValue)
    
    animation.fromValue = locations
    animation.toValue = locations.map { NSNumber(value: $0.doubleValue + (1 + delta) * (config.type.radialDirection ? 1 : -1)) }

    animation.duration = config.duration
    animation.repeatCount = .infinity
    
    return animation
  }
  
  static func opacityAnimation(_ appear: Bool) ->  CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = appear ? 0 : 1
    animation.toValue = appear ? 1 : 0
    animation.duration = 0.2
    animation.repeatCount = 1
    
    return animation
  }
  
}
