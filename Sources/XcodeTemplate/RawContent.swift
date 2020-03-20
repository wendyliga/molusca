internal enum InfoPlist: String {
    case `default`
    case singleApp
    case singleAppIOS12
    case bundle
    
    internal var rawValue: String {
        switch self {
        case .default:
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
        case .singleAppIOS12:
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
               <string>APPL</string>
               <key>CFBundleShortVersionString</key>
               <string>1.0</string>
               <key>CFBundleVersion</key>
               <string>1</string>
               <key>LSRequiresIPhoneOS</key>
               <true/>
               <key>UILaunchStoryboardName</key>
               <string>LaunchScreen</string>
               <key>UIMainStoryboardFile</key>
               <string>Main</string>
               <key>UIRequiredDeviceCapabilities</key>
               <array>
                   <string>armv7</string>
               </array>
               <key>UISupportedInterfaceOrientations</key>
               <array>
                   <string>UIInterfaceOrientationPortrait</string>
                   <string>UIInterfaceOrientationLandscapeLeft</string>
                   <string>UIInterfaceOrientationLandscapeRight</string>
               </array>
               <key>UISupportedInterfaceOrientations~ipad</key>
               <array>
                   <string>UIInterfaceOrientationPortrait</string>
                   <string>UIInterfaceOrientationPortraitUpsideDown</string>
                   <string>UIInterfaceOrientationLandscapeLeft</string>
                   <string>UIInterfaceOrientationLandscapeRight</string>
               </array>
            </dict>
            </plist>

            """
        case .singleApp:
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
                <key>LSRequiresIPhoneOS</key>
                <true/>
                <key>UIApplicationSceneManifest</key>
                <dict>
                    <key>UIApplicationSupportsMultipleScenes</key>
                    <false/>
                    <key>UISceneConfigurations</key>
                    <dict>
                        <key>UIWindowSceneSessionRoleApplication</key>
                        <array>
                            <dict>
                                <key>UISceneConfigurationName</key>
                                <string>Default Configuration</string>
                                <key>UISceneDelegateClassName</key>
                                <string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
                            </dict>
                        </array>
                    </dict>
                </dict>
                <key>UILaunchStoryboardName</key>
                <string>LaunchScreen</string>
                <key>UIRequiredDeviceCapabilities</key>
                <array>
                    <string>armv7</string>
                </array>
                <key>UISupportedInterfaceOrientations</key>
                <array>
                    <string>UIInterfaceOrientationPortrait</string>
                    <string>UIInterfaceOrientationLandscapeLeft</string>
                    <string>UIInterfaceOrientationLandscapeRight</string>
                </array>
                <key>UISupportedInterfaceOrientations~ipad</key>
                <array>
                    <string>UIInterfaceOrientationPortrait</string>
                    <string>UIInterfaceOrientationPortraitUpsideDown</string>
                    <string>UIInterfaceOrientationLandscapeLeft</string>
                    <string>UIInterfaceOrientationLandscapeRight</string>
                </array>
            </dict>
            </plist>

            """
        case .bundle:
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
                <key>NSHumanReadableCopyright</key>
                <string>Copyright © 2020 \(WildCard.authorName.rawValue). All rights reserved.</string>
                <key>NSPrincipalClass</key>
                <string></string>
            </dict>
            </plist>
            """
        }
    }
}

internal enum SwiftFile: String {
    case dummyUnitTest
    case dummyUiTest
    case singleAppDelegate
    case singleIOS12AppDelegate
    case singleAppSceneDelegate
    case dummyViewController
    
    internal var rawValue: String {
        switch self {
        case .dummyUnitTest:
            return """
            //
            //  \(WildCard.targetName.rawValue)Tests.swift
            //  \(WildCard.targetName.rawValue)Tests
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import XCTest

            class \(WildCard.targetName.rawValue)Tests: XCTestCase {

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
        case .dummyUiTest:
            return """
            //
            //  \(WildCard.targetName.rawValue)UITests.swift
            //  \(WildCard.targetName.rawValue)UITests
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import XCTest

            class \(WildCard.targetName.rawValue)UITests: XCTestCase {

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
        case .singleAppDelegate:
            return """
            //
            //  AppDelegate.swift
            //  \(WildCard.targetName.rawValue)
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import UIKit

            @UIApplicationMain
            class AppDelegate: UIResponder, UIApplicationDelegate {

                var window: UIWindow?


                func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                    // Override point for customization after application launch.
                    if #available(iOS 13.0, *) {
                        // In iOS 13 setup is done in SceneDelegate
                    } else {
                        self.window?.makeKeyAndVisible()
                    }

                    return true
                }

                func applicationWillResignActive(_ application: UIApplication) {
                    // Not called under iOS 13 - See SceneDelegate sceneWillResignActive
                    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
                    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
                }

                func applicationDidEnterBackground(_ application: UIApplication) {
                    // Not called under iOS 13 - See SceneDelegate sceneDidEnterBackground
                    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
                }

                func applicationWillEnterForeground(_ application: UIApplication) {
                    // Not called under iOS 13 - See SceneDelegate sceneWillEnterForeground
                    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
                }

                func applicationDidBecomeActive(_ application: UIApplication) {
                    // Not called under iOS 13 - See SceneDelegate sceneDidBecomeActive
                    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
                }

                func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
                    // Override point for customization after application launch.
                    if #available(iOS 13.0, *) {
                        // In iOS 13 setup is done in SceneDelegate
                    } else {
                        let window = UIWindow(frame: UIScreen.main.bounds)
                        self.window = window

                        let viewController = ViewController()
                        window.rootViewController = viewController
                    }

                    return true
                }

                // MARK: UISceneSession Lifecycle

                @available(iOS 13.0, *)
                func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
                    // Called when a new scene session is being created.
                    // Use this method to select a configuration to create the new scene with.
                    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
                }

                @available(iOS 13.0, *)
                func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
                    // Called when the user discards a scene session.
                    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
                    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
                }
            }
            """
            
        case .singleIOS12AppDelegate:
            return """
            //
            //  AppDelegate.swift
            //  \(WildCard.targetName.rawValue)
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue)
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import UIKit

            @UIApplicationMain
            internal class AppDelegate: UIResponder, UIApplicationDelegate {
                internal var window: UIWindow?

                internal func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                    window = UIWindow(frame: UIScreen.main.bounds)

                    let vc = ViewController()
                    let nav = UINavigationController(rootViewController: vc)
                    nav.navigationBar.isTranslucent = false

                    window?.rootViewController = nav
                    window?.makeKeyAndVisible()
                    return true
                }
            }
            """
        case .singleAppSceneDelegate:
            return """
            //
            //  SceneDelegate.swift
            //  \(WildCard.targetName.rawValue)
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import UIKit

            @available(iOS 13.0, *)
            class SceneDelegate: UIResponder, UIWindowSceneDelegate {

                var window: UIWindow?

                func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
                    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
                    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
                    guard let windowScene = (scene as? UIWindowScene) else { return }

                    let window = UIWindow(windowScene: windowScene)
                    self.window = window

                    let viewController = ViewController()
                    window.rootViewController = viewController
                    window.makeKeyAndVisible()
                }

                func sceneDidDisconnect(_ scene: UIScene) {
                    // Called as the scene is being released by the system.
                    // This occurs shortly after the scene enters the background, or when its session is discarded.
                    // Release any resources associated with this scene that can be re-created the next time the scene connects.
                    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
                }

                func sceneDidBecomeActive(_ scene: UIScene) {
                    // Not called under iOS 12 - See AppDelegate applicationDidBecomeActive
                    // Called when the scene has moved from an inactive state to an active state.
                    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
                }

                func sceneWillResignActive(_ scene: UIScene) {
                    // Not called under iOS 12 - See AppDelegate applicationWillResignActive
                    // Called when the scene will move from an active state to an inactive state.
                    // This may occur due to temporary interruptions (ex. an incoming phone call).
                }

                func sceneWillEnterForeground(_ scene: UIScene) {
                    // Not called under iOS 12 - See AppDelegate applicationWillEnterForeground
                    // Called as the scene transitions from the background to the foreground.
                    // Use this method to undo the changes made on entering the background.
                }

                func sceneDidEnterBackground(_ scene: UIScene) {
                    // Not called under iOS 12 - See AppDelegate applicationDidEnterBackground
                    // Called as the scene transitions from the foreground to the background.
                    // Use this method to save data, release shared resources, and store enough scene-specific state information
                    // to restore the scene back to its current state.
                }


            }
            """
        case .dummyViewController:
            return """
            //
            //  ViewController.swift
            //  \(WildCard.targetName.rawValue)
            //
            //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
            //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
            //

            import UIKit

            class ViewController: UIViewController {

                override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view.
                    self.view.backgroundColor = .blue // TODO: Proof we have loaded
                }
            }
            """
        }
    }
}

internal var launchStoryBoard: String {
    return """
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="13122.16" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" launchScreen="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="01J-lp-oVM">
        <dependencies>
            <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="13104.12"/>
            <capability name="Safe area layout guides" minToolsVersion="9.0"/>
            <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
        </dependencies>
        <scenes>
            <!--View Controller-->
            <scene sceneID="EHf-IW-A2E">
                <objects>
                    <viewController id="01J-lp-oVM" sceneMemberID="viewController">
                        <view key="view" contentMode="scaleToFill" id="Ze5-6b-2t3">
                            <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                            <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                            <color key="backgroundColor" xcode11CocoaTouchSystemColor="systemBackgroundColor" cocoaTouchSystemColor="whiteColor"/>
                            <viewLayoutGuide key="safeArea" id="6Tk-OE-BBY"/>
                        </view>
                    </viewController>
                    <placeholder placeholderIdentifier="IBFirstResponder" id="iYj-Kq-Ea1" userLabel="First Responder" sceneMemberID="firstResponder"/>
                </objects>
                <point key="canvasLocation" x="53" y="375"/>
            </scene>
        </scenes>
    </document>
    """
}

internal var frameworkHeader: String {
    return """
    //
    //  \(WildCard.targetName.rawValue).h
    //  \(WildCard.targetName.rawValue)
    //
    //  Created by \(WildCard.authorName.rawValue) on \(WildCard.today.rawValue).
    //  Copyright © \(WildCard.year.rawValue) \(WildCard.authorName.rawValue). All rights reserved.
    //

    #import <Foundation/Foundation.h>

    //! Project version number for \(WildCard.targetName.rawValue).
    FOUNDATION_EXPORT double \(WildCard.targetName.rawValue)VersionNumber;

    //! Project version string for \(WildCard.targetName.rawValue).
    FOUNDATION_EXPORT const unsigned char \(WildCard.targetName.rawValue)VersionString[];

    // In this header, you should import all the public headers of your framework using statements like #import <\(WildCard.targetName.rawValue)/PublicHeader.h>

    """
}
