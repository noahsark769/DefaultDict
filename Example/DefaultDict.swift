//
//  DefaultDict.swift
//  DefaultDict
//
//  Created by Noah Gilmore on 6/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

public final class DefaultDict<Key: Hashable, Value>: CustomStringConvertible {
  typealias Factory = (Key) -> Value
  fileprivate var dict: Dictionary<Key, Value> = [:]
  private let factory: Factory

  subscript(key: Key) -> Value {
    get {
      if let x = dict[key] { return x }
      let x = factory(key)
      dict[key] = x
      return x
    }
    set {
      dict[key] = newValue
    }
  }

  init(value: Value) {
    self.factory = { _ in value }
  }

  init(factory: @escaping Factory) {
    self.factory = factory
  }

  init(factory: @escaping () -> Value) {
    self.factory = { _ in factory() }
  }

  public var description: String { return dict.description }
}

