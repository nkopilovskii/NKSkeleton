//
//  CAGradientLayer.swift
//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import Foundation
import QuartzCore

extension CAGradientLayerType {
  
  
  
  static func type(for skeletonType: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> String {
    let kNKSkeletonGradientLayerTypeRadial = "radial"
    let kNKSkeletonGradientLayerTypeAxial = "axial"
    
    guard skeletonType == .axial else { return kNKSkeletonGradientLayerTypeRadial }
    
    switch initialPosition {
    case .center: return kNKSkeletonGradientLayerTypeRadial
    default: return kNKSkeletonGradientLayerTypeAxial
    }
  }
  
}

