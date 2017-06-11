//
//  DefaultDict.swift
//  DefaultDict
//
//  Created by Noah Gilmore on 6/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

/**
 * A dictionary with default values.
 *
 * DefaultDict behaves in most respects like a regular dictionary, with the added fact that when a key
 * that does not exist int he dictionary is accessed, a default value will be returned. A factory method
 * for creating default values at access time can also be specified instead of a static value.
 */
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
      print("yes")
    }
  }

  /**
   * Initialize the dict with a given default value.
   *
   * - Parameter value: The default value to return when a nonexistent key is accessed.
   */
  init(value: Value) {
    self.factory = { _ in value }
  }

  /**
   * Initialize the dict with a factory which produces a default value based on the key which was accessed.
   *
   * - Parameter factory: A function which is called when a nonexistent key is accessed. This function
   *   is passed the key which was accessed and its return value is reported as the default value. This
   *   function will not be called on subsequent accesses of the same key (its return value will be saved).
   */
  init(factory: @escaping Factory) {
    self.factory = factory
  }

  /**
   * Initialize the dict with a factory which produces a default value.
   *
   * - Parameter factory: A function which is called when a nonexistent key is accessed. See `init(factory:)`.
   */
  init(factory: @escaping () -> Value) {
    self.factory = { _ in factory() }
  }

  public var description: String { return dict.description }
}

