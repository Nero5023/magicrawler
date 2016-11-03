//
//  NetworkOperation.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/10/30.
//
//

import Foundation

class NetworkOperation: Operation {
  
  let task: URLSessionTask
  
  init(_ task: URLSessionTask) {
    self.task = task
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
    self.task.resume()
  }
  
  override func cancel() {
    super.cancel()
    self.task.cancel()
    self.isFinished = true
    self.isExecuting = false
  }
}
