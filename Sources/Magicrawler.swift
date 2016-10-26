//
//  MagicCrawler.swift
//  magicrawler
//
//  Created by 金高铭 on 2016/10/26.
//
//

import Foundation


class Magicrawler{
    
    //MARK: Properties
    private let name: String
    private let requestManager: RequestManager

    
    //MARK: functions
    
    init(name: String) {
        self.name = name
        self.requestManager = RequestManager()
        self.requestManager.delegate = self
    }
    
    /**
     Set some urls easily for a quick start
     - parameter urlList: urls which this crawler can use right now
     - Returns: None
     
     */
    public func setRequests(urlList: [String]){
        
    }
    
    /**
     send a URLrequest
     - parameter request: a URL request which will be sent
     */
    func sendRequest(request: URLRequest){
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: self.parse)
        task.resume()
        print("send request: \(request)")
    }
    
    /**
     add a request which waiting to be sent
     */
    final public func appendRequest(_ request:RequestConvertible){
        self.requestManager.append(request)
    }
    
    
    /**
     add a url which waiting to be request
    */
    final public func appendURL(_ url: URLConvertible){
      do {
        let request = try URLRequest(url: url, method: .get, headers: nil)
        self.requestManager.append(request)
      }catch let error {
        print(error)
      }
      
    }
    
    /**
     this func should be override to parse you own response
    */
    public func parse(data: Data?, reponse: URLResponse?, error: Error?){
        
    }
    
    
    
}


extension Magicrawler: RequestManagerDelegate {
    func willSendRequest(request: URLRequest){
        self.sendRequest(request: request)
    }
}






