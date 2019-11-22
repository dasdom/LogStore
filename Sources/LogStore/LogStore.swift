//  Created by dasdom on 27.10.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation

struct LogStore {
  static var log: [LogItem] = []
  
  static func setupLog() {
    guard let data = try? Data(contentsOf: FileManager.documentsURL) else {
      return
    }
    if let potentialLog = try? JSONDecoder().decode([LogItem].self, from: data) {
      log = potentialLog
    }
  }
  
  static func writeLog() {
    DispatchQueue.global(qos: .background).async {
      do {
        let data = try JSONEncoder().encode(log)
        try data.write(to: FileManager.documentsURL, options: .atomicWrite)
      } catch {
        print("error: \(error)")
      }
    }
  }
}

extension FileManager {
  static var documentsURL: URL {
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
    return url.appendingPathComponent("log")
  }
}

public func printLog(_ string: String) {
  print(string)
  
  let logItem = LogItem(date: Date(), text: string)
  LogStore.log.append(logItem)
  
  LogStore.writeLog()
}

