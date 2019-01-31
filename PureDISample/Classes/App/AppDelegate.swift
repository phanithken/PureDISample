//
//  AppDelegate.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/21.
//  Copyright © 2019 PK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let compositionRoot: CompositionRoot
    
    private override init() {
        self.compositionRoot = CompositionRoot.resolve()
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // the root of the PureDI called, it will be continued like a stack
        let root = self.compositionRoot.navigationRootViewControllerFactory.create(
            payload: RootNavigationViewController.Payload.init()
        )
        self.compositionRoot.dependency.window.rootViewController = root
        self.compositionRoot.dependency.window.makeKeyAndVisible()
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = ViewController()
//        self.window?.makeKeyAndVisible()
        return true
    }

}

