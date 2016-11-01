//
//  DataRequestDelegate.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/11/1.
//
//

import Foundation

class DataTaskDelegate: NSObject, URLSessionDataDelegate {
  
  
  var dataTaskDidReceiveResponse: ((URLSession, URLSessionDataTask, URLResponse) -> URLSession.ResponseDisposition)?
  var dataTaskDidReceiveData: ((URLSession, URLSessionDataTask, Data) -> Void)?
  var dataTaskWillCacheResponse: ((URLSession, URLSessionDataTask, CachedURLResponse) -> CachedURLResponse?)?
  
  // Tells the delegate that the data task received the initial reply (headers) from the server.
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
    var disposition: URLSession.ResponseDisposition = .allow
    if let dataTaskDidReceiveResponse = dataTaskDidReceiveResponse {
      disposition = dataTaskDidReceiveResponse(session, dataTask, response)
    }
    completionHandler(disposition)
  }
  
//  Tells the delegate that the data task has received some of the expected data.
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {
    print("dataTaskDidBecomeDownloadTask")
    fatalError("Didn't implement didBecome downloadTask")
  }
  
//  Asks the delegate whether the data (or upload) task should store the response in the cache.
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    print("dataTaskDidReceiveData")
    print(Thread.current)
//    print(String(data: data, encoding: .utf8))
    print(data)
    if let dataTaskDidReceiveData = dataTaskDidReceiveData {
      dataTaskDidReceiveData(session, dataTask, data)
    }
  }
  
//  Asks the delegate whether the data (or upload) task should store the response in the cache.
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: @escaping (CachedURLResponse?) -> Void) {
    print("dataTaskWillCacheResponse")
    print(Thread.current)
    var cachedReponse: CachedURLResponse? = proposedResponse
    if let dataTaskWillCacheResponse = dataTaskWillCacheResponse {
      cachedReponse = dataTaskWillCacheResponse(session, dataTask, proposedResponse)
    }
    completionHandler(cachedReponse)
  }
  
  
}
