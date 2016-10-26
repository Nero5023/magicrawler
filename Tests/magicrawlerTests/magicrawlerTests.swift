import XCTest
@testable import Magicrawler

class MagicrawlerTests: XCTestCase {
    func testExample() {
      let crawler = MyCrawler(name: "123")
      DispatchQueue.global().async {
        for _ in 0..<10 {
          crawler.appendURL("http://www.jianshu.com/p/2142c3cebf75")
        }
      }
      while true {
        
      }
      
    }


}




class MyCrawler: Magicrawler {
  override func parse(data: Data?, reponse: URLResponse?, error: Error?) {
    print("data: \(data)")
    print("reponde: \(reponse)")
    print("error: \(error)")
    print("==============================")
  }
}
