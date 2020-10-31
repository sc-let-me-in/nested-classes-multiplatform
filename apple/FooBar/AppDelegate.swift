//
//  AppDelegate.swift
//  FooBar
//
//  Created by Nick Thompson on 8/15/20.
//  Copyright © 2020 Nick Thompson. All rights reserved.
//

import UIKit
import FooShared

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func fooSharedExampleProblem() {
        let api = Api()

        // Cannot initialize/find name
        // let commonFizzHello = CommonFizz.Hello(myName: "hello")

        // Also cannot use in function call (can't even find function)
        // api.nestedArgFromOtherModuleHello(hello: CommonFizz.Hello(myName: "hello"))

        api.argFromOtherModule(hey: CommonHey(myName: "hello"))
        api.nestedArgFromThisModule(nest: Nest.Nested(name: "hello"))
        api.noArgFunction()
    }
}

