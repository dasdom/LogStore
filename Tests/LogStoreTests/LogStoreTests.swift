import XCTest
@testable import LogStore

final class LogStoreTests: XCTestCase {
  func test_printLog_addsLogItem() {
    printLog("Foo")
    
    XCTAssertEqual("Foo", LogStore.log.first?.text)
  }
  
  static var allTests = [
    ("test_printLog_addsLogItem", test_printLog_addsLogItem),
  ]
}
