import XCTest

import MoluscaTests
import moluscaHelperTests

var tests = [XCTestCaseEntry]()
tests += moluscaTests.allTests()
tests += moluscaHelperTests.allTests()

XCTMain(tests)
