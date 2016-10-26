//
//  RequestManager.swift
//  magicrawler
//
//  Created by Nero Zuo on 16/10/26.
//
//

import Foundation

/// Types adopting the RequestConvertible protocol can be uesed to generate url request
protocol RequestConvertible {
  // return the url request
  var getURLRequest: URLRequest { get }
}

extension URLRequest: RequestConvertible {
  public var getURLRequest: URLRequest {
    return self
  }
}


/// The Request Manager Delegate
protocol RequestManagerDelegate: class {
  /// when the request queue has request
  func willSendRequest(request: URLRequest)
}

class RequestManager {
  // MARK: Properties
  /// The delegate for the handle
  weak var delegate: RequestManagerDelegate?
  /// To check if has request
  let concurrentQueue: DispatchQueue
  /// request queue
  let requestQueue: Queue<RequestConvertible>
  
  init() {
    concurrentQueue = DispatchQueue(label: "com.magicrawler.RequestManager.concurrentQueue", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    requestQueue = Queue()
    checkRequestQueue()
  }
  
  /**
     Check the requestQueue if has request,
     if has request notify the delegate
   */
  fileprivate func checkRequestQueue() {
    concurrentQueue.async {
      while true {
        if let request = self.requestQueue.dequeue() {
          self.delegate?.willSendRequest(request: request.getURLRequest)
        }
      }
    }
  }
  
  /**
     Add new request to the request queue
     It's thread safe
     
     - parameter newRequest: the type which adopts to RequestConvertible
   */
  func append(_ newRequest: RequestConvertible) {
    self.requestQueue.enqueue(newRequest)
  }
  
  /**
      Add new requests to the request queue
   
      - parameter newRequests: the array contains the type which adopts to RequestConvertible
   */
  func append(_ newRequests: [RequestConvertible]) {
    for request in newRequests {
      self.requestQueue.enqueue(request)
    }
  }
  
}
