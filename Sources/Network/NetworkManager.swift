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
  
  let operationQueue = OperationQueue()
  let delegate: DataTaskDelegate
  
  init() {
    self.delegate = DataTaskDelegate()
    self.session = URLSession(configuration: .default, delegate: delegate, delegateQueue: nil)
    operationQueue.maxConcurrentOperationCount = 50
  }
  
  func request(_ urlRequest: RequestConvertible) {
//    let task = self.session.dataTask(with: try! urlRequest.asURLRequest())
    let task = URLSession.shared.dataTask(with: try! urlRequest.asURLRequest()) { data, reponse, error in
      print(data)
      print("---")
      
      print((reponse as? HTTPURLResponse)?.statusCode) 
      
    }
    task.resume()
//    let operation = NetworkOperation(task)
//    operationQueue.addOperation(operation)
  }
  
  deinit {
    session.invalidateAndCancel()
  }
  
}
