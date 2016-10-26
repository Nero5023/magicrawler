//
//  NetworkProtocols.swift
//  Magicrawler
//
//  Created by Nero Zuo on 16/10/26.
//
//

import Foundation

// MARK: MCError
enum MCError: Error {
  case invalidURL(url: URLConvertible)
}

// MARK: URLConvertible
protocol URLConvertible {
  func asURL() throws -> URL
}

extension URL: URLConvertible {
  func asURL() throws -> URL {
    return self
  }
}

extension String: URLConvertible {
  func asURL() throws -> URL {
    guard let url = URL(string: self) else {
      throw MCError.invalidURL(url: self)
    }
    return url
  }
}

//MARK: RequestConvertible
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

extension URLRequest {
  
}


public enum HTTPMethod: String {
  case options = "OPTIONS"
  case get     = "GET"
  case head    = "HEAD"
  case post    = "POST"
  case put     = "PUT"
  case patch   = "PATCH"
  case delete  = "DELETE"
  case trace   = "TRACE"
  case connect = "CONNECT"
}
