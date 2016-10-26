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
public protocol URLConvertible {
  func asURL() throws -> URL
}

extension URL: URLConvertible {
  public func asURL() throws -> URL {
    return self
  }
}

extension String: URLConvertible {
  public func asURL() throws -> URL {
    guard let url = URL(string: self) else {
      throw MCError.invalidURL(url: self)
    }
    return url
  }
}

//MARK: RequestConvertible
/// Types adopting the RequestConvertible protocol can be uesed to generate url request
public protocol RequestConvertible {
  // return the url request
  var getURLRequest: URLRequest { get }
}

extension URLRequest: RequestConvertible {
  public var getURLRequest: URLRequest {
    return self
  }
}


public typealias HTTPHeaders = [String: String]

extension URLRequest {
  public init(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders? = nil) throws {
    let url = try url.asURL()
    
    self.init(url: url)
    httpMethod = method.rawValue
    
    if let headers = headers {
      for (headerField, headerValue) in headers {
        setValue(headerValue, forHTTPHeaderField: headerField)
      }
    }
  }
}

/// The HTTP methods enum
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
