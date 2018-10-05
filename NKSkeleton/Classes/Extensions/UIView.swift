//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit

extension UIView {
  
  func subviews(at level: Int) -> [UIView] {
    guard level > 0 else { return [self] }
    
    var views = [UIView]()
    subviews.forEach { $0.subviews(&views, currentLevel: 1, destinationLevel: level) }
    
    return views
  }
  
  private func subviews(_ views: inout [UIView], currentLevel: Int,  destinationLevel: Int)  {
    currentLevel != destinationLevel  ? subviews.forEach { $0.subviews(&views, currentLevel: currentLevel + 1, destinationLevel: destinationLevel) } : views.append(self)
  }
  
}

extension Array where Element: UIView {
  
  func mask(for rootView: UIView) -> CAShapeLayer? {
    guard !isEmpty else { return nil }
    
    let path = UIBezierPath()
    forEach { path.append(UIBezierPath(roundedRect: $0.convert($0.bounds, to: rootView), cornerRadius: $0.layer.cornerRadius)) }
    
    let maskLayer = CAShapeLayer()
    maskLayer.frame = rootView.bounds
    maskLayer.path = path.cgPath
    
    return maskLayer
  }
  
}
