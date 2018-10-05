//
//  NKSkeleton.swift
//
//  Created by Nick Kopilovskii on 17.09.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

public class NKSkeleton {
  
  var configuration = NKSkeletonConfiguration()
  
  weak var sourceView: UIView?
  
  public init(configuration: NKSkeletonConfiguration, sourceView: UIView? = nil) {
    self.configuration = configuration
    self.sourceView = sourceView
  }
  
  
  /**
   Show skeleton on `sourceView`
   */
  public func show(on sourceView: UIView? = nil) {
    if let sview = sourceView { self.sourceView = sview }
    
    guard let view = self.sourceView else { return }
    
    let views = view.subviews(at: configuration.subviewsLevel)
    
    guard let mask = views.mask(for: view),  let gradient = CAGradientLayer.layer(with: mask, configuration: configuration) else { return }
    
    view.layer.addWithOpacityAnimation(gradient)
    
    guard configuration.isAnimatable, let animation = CABasicAnimation.animation(for: gradient, config: configuration) else { return }
    
    gradient.add(animation, forKey: #function)
    view.isUserInteractionEnabled = false
  }
  
  /**
   Hide skeleton on `sourceView`
   */
  public func remove() {
    sourceView?.isUserInteractionEnabled = true
    sourceView?.layer.sublayer(with: CAGradientLayer.kNKSkeletonGradientLayer)?.removeFromSuperlayerWithOpacityAnimation()
  }
  
}

