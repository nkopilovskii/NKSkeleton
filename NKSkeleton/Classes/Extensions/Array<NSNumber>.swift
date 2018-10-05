//
//  Created by Nick Kopilovskii
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import Foundation


extension Array where Iterator.Element == NSNumber {
  
  static func initialLocations(for type: NKSkeletonConfiguration.NKType, count: Int, with delta: Double) -> [NSNumber] {

    var colorLocations = [NSNumber]()
    
    if type.radialDirection {
      (0...(count - 1)).forEach { colorLocations.append(NSNumber(value: 1 - delta * Double($0))) }
    }
    else {
      (0...(count - 1)).forEach { colorLocations.append(NSNumber(value: delta * Double($0))) }
    }
    
    return type.radialDirection ? colorLocations.reversed() : colorLocations
  }
  
}
