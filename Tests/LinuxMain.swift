import XCTest

import MoluscaTests

var tests = [XCTestCaseEntry]()
tests += moluscaTests.allTests()
tests += moluscaHelperTests.allTests()

XCTMain(tests)
