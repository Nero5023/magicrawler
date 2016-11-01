//
//  NetworkManager.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/11/1.
//
//

import Foundation

open class NetworkManger {
  
  open let session: URLSession
  
  let queue = DispatchQueue(label: "com.magicrawler.networkmanager" + UUID().uuidString, qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
  
//  let delegate: 
  
  init() {
    self.session = URLSession(configuration: .default, delegate: DataTaskDelegate(), delegateQueue: nil)
  }
  
  func request(_ urlRequest: RequestConvertible) {
    self.session.dataTask(with: try! urlRequest.asURLRequest())
  }
  
}
