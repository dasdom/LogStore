//  Created by dasdom on 27.10.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation

struct LogStore {
  static var log: [LogItem] = []
  
  static func setupLog() {
    do {
      let data = try Data(contentsOf: FileManager.documentsURL)
      log = try JSONDecoder().decode([LogItem].self, from: data)
    } catch {
      print("error: \(error)")
    }
  }
  
  static func writeLog() {
    DispatchQueue.global(qos: .background).async {
      do {
        let data = JSONEncoder().encode(log)
        data.write(to: FileManager.documentsURL, options: .atomicWrite)
      } catch {
        print("error: \(error)")
      }
    }
  }
}

extension FileManager {
  static var documentsURL: URL {
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
    return url
  }
}

public func printLog(_ string: String) {
  print(string)
  
  let logItem = LogItem(date: Date(), text: string)
  LogStore.log.append(logItem)
  
  LogStore.writeLog()
}

