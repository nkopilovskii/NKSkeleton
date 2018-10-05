//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

extension CALayer {
  
  private static let kNKAddLayerOpacityAnimation = "kNKAddLayerOpacityAnimation"
  private static let kNKRemoveLayerOpacityAnimation = "kNKRemoveLayerOpacityAnimation"
  
  func addWithOpacityAnimation(_ layer: CALayer) {
    layer.opacity = 1
    addSublayer(layer)
    
    let animation = CABasicAnimation.opacityAnimation(true)//(keyPath: "opacity")
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


