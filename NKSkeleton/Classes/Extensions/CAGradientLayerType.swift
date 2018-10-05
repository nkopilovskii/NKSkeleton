//
//  CAGradientLayerType.swift
//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import Foundation
import QuartzCore

extension CAGradientLayerType {
  
  fileprivate static let kNKSkeletonGradientLayerTypeRadial = "radial"
  fileprivate static let kNKSkeletonGradientLayerTypeAxial = "axial"
  
  static func type(for skeletonType: NKSkeletonConfiguration.NKType, initialPosition: NKSkeletonConfiguration.NKInitialPosition) -> String {
    
    guard skeletonType == .axial else { return kNKSkeletonGradientLayerTypeRadial }
    
    switch initialPosition {
    case .center: return kNKSkeletonGradientLayerTypeRadial
    default: return kNKSkeletonGradientLayerTypeAxial
    }
  }
  
}
