//
//  NetworkOperation.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/10/30.
//
//

import Foundation

class NetworkOperation: Operation {
  
  let request: RequestConvertible
  
  init(_ request: RequestConvertible) {
    self.request = request
  }
  
  private var _executing : Bool = false
  override var isExecuting : Bool {
    get { return _executing }
    set {
      guard _executing != newValue else { return }
      willChangeValue(forKey: "isExecuting")
      _executing = newValue
      didChangeValue(forKey: "isExecuting")
    }
  }
  
  
  private var _finished : Bool = false
  override var isFinished : Bool {
    get { return _finished }
    set {
      guard _finished != newValue else { return }
      willChangeValue(forKey: "isFinished")
      _finished = newValue
      didChangeValue(forKey: "isFinished")
    }
  }
  
  override var isConcurrent: Bool  {
    get {
      return true
    }
  }
  
  override func start() {
    self.isExecuting = true
    self.isFinished = false
    let mainQueue = OperationQueue.main
    mainQueue.addOperation {
//      URLSession(configuration: <#T##URLSessionConfiguration#>, delegate: <#T##URLSessionDelegate?#>, delegateQueue: <#T##OperationQueue?#>)
    }
  }
}
