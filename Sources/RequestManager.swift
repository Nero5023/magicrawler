//
//  RequestManager.swift
//  magicrawler
//
//  Created by Nero Zuo on 16/10/26.
//
//

import Foundation

protocol RequestConvertible {
  var URLRequest: URLRequest { get }
}

extension URLRequest: RequestConvertible {
  public var URLRequest: URLRequest {
    return self
  }
}

protocol RequestManagerDelegate {
  func willSendRequest(request: URLRequest)
}

class RequestManager {
  
}
