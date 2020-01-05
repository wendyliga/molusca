import Foundation

/**
 Tempalate Content
 */
internal final class TemplateContent {
    /**
     Singleton of DateFormatter, so task that utilize Date Formatting will not recreate `DateFormatter` instance which known have really huge performance usage.
     */
    private static let dateFormatter = DateFormatter()
    
    /**
     Get Today value in string
     
     Example: 31/12/2020
     */
    private static func todayStringValue() -> String{
        dateFormatter.dateFormat = "dd/MM/yy"
        
        return dateFormatter.string(from: Date())
    }
    
    /**
     Get Year value in String
     
     Example: 2020
     */
    private static func yearStringValue() -> String{
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: Date())
    }
    
    internal static func infoPlist() -> String {
        return """
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
    }
    
    internal static func unitTest(targetName: String,
                                  authorName: String,
                                  today: String = TemplateContent.todayStringValue(),
                                  year: String = TemplateContent.yearStringValue()) -> String {
        return """
        //
        //  \(targetName)Tests.swift
        //  \(targetName)Tests
        //
        //  Created by \(authorName) on \(today).
        //  Copyright © \(year) \(authorName). All rights reserved.
        //

        import XCTest

        class \(targetName)Tests: XCTestCase {

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
    }
    
    internal static func uiTest(targetName: String,
                                authorName: String,
                                today: String = TemplateContent.todayStringValue(),
                                year: String = TemplateContent.yearStringValue()) -> String {
        return """
        //
        //  \(targetName)UITests.swift
        //  \(targetName)UITests
        //
        //  Created by \(authorName) on \(today).
        //  Copyright © \(year) \(authorName). All rights reserved.
        //

        import XCTest

        class \(targetName)UITests: XCTestCase {

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
    }
}
