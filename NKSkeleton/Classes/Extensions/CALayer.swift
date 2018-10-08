//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

extension CALayer {
  
  fileprivate static let kNKAddLayerOpacityAnimation = "kNKAddLayerOpacityAnimation"
  fileprivate static let kNKRemoveLayerOpacityAnimation = "kNKRemoveLayerOpacityAnimation"
  
  func addWithOpacityAnimation(_ layer: CALayer) {
    layer.opacity = 1
    addSublayer(layer)
    
    let animation = CABasicAnimation.opacityAnimation(true)
    layer.add(animation, forKey: CALayer.kNKAddLayerOpacityAnimation)
  }
  
  func removeFromSuperlayerWithOpacityAnimation() {
    
    opacity = 0
    DispatchQueue.main.async {
      let animation = CABasicAnimation.opacityAnimation(false)
      self.add(animation, forKey: CALayer.kNKRemoveLayerOpacityAnimation)
      
      DispatchQueue.main.asyncAfter(deadline: .now() + animation.duration) {
        self.removeFromSuperlayer()
      }
    }

  }

  func sublayer(with name: String) -> CALayer? {
    return sublayers?.first(where: { $0.name == name })
  }
  
}


