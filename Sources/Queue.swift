//
//  Queue.swift
//  magicrawler
//
//  Created by Nero Zuo on 16/10/26.
//
//

import Foundation
import Dispatch

protocol QueueType {
  associatedtype Element
  
  mutating func enqueue(_ newElement: Element)
  
  mutating func dequeue() -> Element?
  
  func peek() -> Element?
}

class Queue<T>: QueueType{
  typealias Element = T
  
  private var left: [T]
  private var right: [T]
  
  private let concurrentQueue: DispatchQueue
  
  
  init(elements: [T]) {
    left = elements.reversed()
    right = []
    concurrentQueue = DispatchQueue(label: "com.magicrawler.Queue.concurrentQueue", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
  }
  
  convenience init() {
    self.init(elements: [])
  }
  
  func enqueue(_ newElement: T) {
    concurrentQueue.async(group: nil, qos: .userInitiated, flags: .barrier) {
      self.right.append(newElement)
    }
  }
  
  func dequeue() -> T? {
    var firstElement: T?
    concurrentQueue.sync {
      if (left.isEmpty && right.isEmpty) {
        firstElement = nil
      }else {
        if left.isEmpty {
          left = right.reversed()
          right.removeAll(keepingCapacity: true)
        }
        firstElement = left.removeLast()
      }
    }
    return firstElement
  }
  
  func peek() -> T? {
    var element:T? = nil
    concurrentQueue.sync {
      if !left.isEmpty {
        element = left.last
      }else {
        element = right.first
      }
    }
    return element
  }
  
}
