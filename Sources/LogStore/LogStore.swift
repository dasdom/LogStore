//  Created by dasdom on 27.10.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation

struct LogStore {
  static var log: [String] = []
}

public func printLog(_ string: String) {
  print(string)
  
  LogStore.log.append(string)
}

