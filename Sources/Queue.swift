//
//  Queue.swift
//  magicrawler
//
//  Created by Nero Zuo on 16/10/26.
//
//

import Foundation

protocol QueueType {
  associatedtype Element
  
  mutating func enqueue(_ newElement: Element)
  
  mutating func dequeue() -> Element?
  
  func peek() -> Element?
}

struct Queue<T>: QueueType{
  typealias Element = T
  
  private var left: [T]
  private var right: [T]
  
  init() {
    left = []
    right = []
  }
  
  mutating func enqueue(_ newElement: T) {
    right.append(newElement)
  }
  
  mutating func dequeue() -> T? {
    guard !(left.isEmpty && right.isEmpty) else { return nil }
    if left.isEmpty {
      left = right.reversed()
      right.removeAll(keepingCapacity: true)
    }
    return left.removeLast()
  }
  
  func peek() -> T? {
    if !left.isEmpty {
      return left.last
    }else {
      return right.first
    }
  }
  
}
