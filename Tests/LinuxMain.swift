import XCTest

import MoluscaTests
import MoluscaHelperTests
import XcodeTemplateTests

var tests = [XCTestCaseEntry]()
tests += MoluscaTests.allTests()
tests += MoluscaHelperTests.allTests()
tests += XcodeTemplateTests.allTests()

XCTMain(tests)
