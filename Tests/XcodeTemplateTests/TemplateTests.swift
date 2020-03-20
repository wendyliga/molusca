import XCTest

@testable import XcodeTemplate

internal final class TemplateTests: XCTestCase {
    internal func test_unitTestTemplate() {
        let unitTestTemplate = Template.unitTest
        let content = unitTestTemplate.contents(targetName: "Molusca", authorName: "Wendy Liga", year: "2020", today: "20-20-2020")
        
        let infoPlist = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>CFBundleDevelopmentRegion</key>
            <string>$(DEVELOPMENT_LANGUAGE)</string>
            <key>CFBundleExecutable</key>
            <string>$(EXECUTABLE_NAME)</string>
            <key>CFBundleIdentifier</key>
            <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
            <key>CFBundleInfoDictionaryVersion</key>
            <string>6.0</string>
            <key>CFBundleName</key>
            <string>$(PRODUCT_NAME)</string>
            <key>CFBundlePackageType</key>
            <string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
            <key>CFBundleShortVersionString</key>
            <string>1.0</string>
            <key>CFBundleVersion</key>
            <string>1</string>
        </dict>
        </plist>
        """
        
        let dummyTest =
        """
        //
        //  MoluscaTests.swift
        //  MoluscaTests
        //
        //  Created by Wendy Liga on 20-20-2020.
        //  Copyright © 2020 Wendy Liga. All rights reserved.
        //

        import XCTest

        class MoluscaTests: XCTestCase {

            override func setUp() {
                // Put setup code here. This method is called before the invocation of each test method in the class.
            }

            override func tearDown() {
                // Put teardown code here. This method is called after the invocation of each test method in the class.
            }

            func testExample() {
                // This is an example of a functional test case.
                // Use XCTAssert and related functions to verify your tests produce the correct results.
            }

            func testPerformanceExample() {
                // This is an example of a performance test case.
                measure {
                    // Put the code you want to measure the time of here.
                }
            }

        }
        """
        
        let testTarget = [TemplateContent(fileName: "Info", content: infoPlist, extension: "plist"), TemplateContent(fileName: "MoluscaTests", content: dummyTest, extension: "swift")]
        
        XCTAssertEqual(content, testTarget)
    }
    
    internal func test_uiTestTemplate() {
        let uiTestTemplate = Template.uiTest
        let content = uiTestTemplate.contents(targetName: "Molusca", authorName: "Wendy Liga", year: "2020", today: "20-20-2020")
        
        let infoPlist = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>CFBundleDevelopmentRegion</key>
            <string>$(DEVELOPMENT_LANGUAGE)</string>
            <key>CFBundleExecutable</key>
            <string>$(EXECUTABLE_NAME)</string>
            <key>CFBundleIdentifier</key>
            <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
            <key>CFBundleInfoDictionaryVersion</key>
            <string>6.0</string>
            <key>CFBundleName</key>
            <string>$(PRODUCT_NAME)</string>
            <key>CFBundlePackageType</key>
            <string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
            <key>CFBundleShortVersionString</key>
            <string>1.0</string>
            <key>CFBundleVersion</key>
            <string>1</string>
        </dict>
        </plist>
        """
        
        let dummyTest =
        """
        //
        //  MoluscaUITests.swift
        //  MoluscaUITests
        //
        //  Created by Wendy Liga on 20-20-2020.
        //  Copyright © 2020 Wendy Liga. All rights reserved.
        //
        
        import XCTest

        class MoluscaUITests: XCTestCase {

            override func setUp() {
                // Put setup code here. This method is called before the invocation of each test method in the class.

                // In UI tests it is usually best to stop immediately when a failure occurs.
                continueAfterFailure = false

                // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
            }

            override func tearDown() {
                // Put teardown code here. This method is called after the invocation of each test method in the class.
            }

            func testExample() {
                // UI tests must launch the application that they test.
                let app = XCUIApplication()
                app.launch()

                // Use recording to get started writing UI tests.
                // Use XCTAssert and related functions to verify your tests produce the correct results.
            }

            func testLaunchPerformance() {
                if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                    // This measures how long it takes to launch your application.
                    measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                        XCUIApplication().launch()
                    }
                }
            }
        }
        """
        
        let testTarget = [TemplateContent(fileName: "Info", content: infoPlist, extension: "plist"), TemplateContent(fileName: "MoluscaUITests", content: dummyTest, extension: "swift")]
        
        XCTAssertEqual(content, testTarget)
    }
    
    internal func test_frameworkTemplate() {
        let uiTestTemplate = Template.framework
        let content = uiTestTemplate.contents(targetName: "Molusca", authorName: "Wendy Liga", year: "2020", today: "20-20-2020")
        
        let header = """
        //
        //  Molusca.h
        //  Molusca
        //
        //  Created by Wendy Liga on 20-20-2020.
        //  Copyright © 2020 Wendy Liga. All rights reserved.
        //

        #import <Foundation/Foundation.h>

        //! Project version number for Molusca.
        FOUNDATION_EXPORT double MoluscaVersionNumber;

        //! Project version string for Molusca.
        FOUNDATION_EXPORT const unsigned char MoluscaVersionString[];

        // In this header, you should import all the public headers of your framework using statements like #import <Molusca/PublicHeader.h>

        """
        
        XCTAssertEqual(content, [TemplateContent(fileName: "Molusca", content: header, extension: "h")])
    }
}
