//  Created by dasdom on 27.10.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation

struct LogStore {
  static var log: [LogItem] = []
}

public func printLog(_ string: String) {
  print(string)
  
  let logItem = LogItem(date: Date(), text: string)
  LogStore.log.append(logItem)
}

