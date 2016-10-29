import XCTest
@testable import Magicrawler

class MagicrawlerTests: XCTestCase {
    func testExample() {
      let crawler = MyCrawler(name: "123")

      DispatchQueue.global().async {
        for i in 0..<5000 {
          crawler.appendURL("http://www.jianshu.com/p/2142c3cebf75")
          print(i)
        }
        for i in 0..<5000 {
          crawler.appendURL("http://blog.sina.com.cn/s/blog_7011f21c0101aoo7.html")
          print(i)
        }
      }
      
      let runloop = RunLoop.current
      runloop.add(Port(), forMode: .commonModes)
      runloop.run()
      
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
