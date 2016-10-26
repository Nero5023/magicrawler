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
     - parameter request: a URL request which will be send
     */
    func sendRequest(request: URLRequest){
        
    }
    
    /**
     
     */
    
    
}


extension Magicrawler: RequestManagerDelegate {
    func willSendRequest(request: URLRequest){
        self.sendRequest(request: request)
    }
}






