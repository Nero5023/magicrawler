//
//  NetworkTest.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/11/1.
//
//

import XCTest
@testable import Magicrawler

class NetworkTest: XCTestCase {
  func testDelegate() {
    NetworkManger().request(URLRequest(url: try! "http://swiftcafe.io/2015/12/20/nsurlsession/".asURL()))
    let runloopmain = RunLoop.main
    runloopmain.run()
    print("hello world")
  }
}
