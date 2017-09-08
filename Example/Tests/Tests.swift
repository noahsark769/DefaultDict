import UIKit
import XCTest
import DefaultDict

class Tests: XCTestCase {
  func testBasicFunctionality() {
    let d = DefaultDict<String, Int>(value: 0)
    d["a"] = 1
    XCTAssertEqual(d["a"], 1)
    XCTAssertEqual(d["b"], 0)
  }

  func testArray() {
    let d = DefaultDict<String, Array<String>>(value: ["default"])
    XCTAssertEqual(d["one"], ["default"])
    d["one"].append("two")
    XCTAssertEqual(d["one"], ["default", "two"])
  }

  func testFactory() {
    var value = 0
    let d = DefaultDict<String, Int>(factory: { value })
    XCTAssertEqual(d["one"], 0)
    value = 1
    XCTAssertEqual(d["two"], 1)
    // Since one has already been assigned, it should still be zero
    XCTAssertEqual(d["one"], 0)
  }

  func testFactoryWithKey() {
    let d = DefaultDict<String, String>(factory: { key in key })
    XCTAssertEqual(d["one"], "one")
    d["two"] = "not two"
    XCTAssertEqual(d["two"], "not two")
  }

  func testFactoryNotCalledMultipleTimes() {
    var calls = 0
    let d = DefaultDict<String, String> {
      calls += 1
      return "default"
    }
    XCTAssertEqual(d["one"], "default")
    d["one"] = "one"
    d["one"] = "two"
    XCTAssertEqual(calls, 1)
  }

  func testExportToDict() {
    let d = DefaultDict<String, [String]>(value: [])
    d["one"].append("two")
    let dict = d.asDict()
    XCTAssertEqual(dict["one"]!, ["two"])
    XCTAssertEqual(dict.keys.count, 1)

    d["one"].append("three")
    d["two"].append("four")
    let newDict = d.asDict()
    XCTAssertEqual(newDict["one"]!, ["two", "three"])
    XCTAssertEqual(newDict["two"]!, ["four"])
    XCTAssertEqual(newDict.keys.count, 2)
  }
}
