//
//  AppDelegate.swift
//  ComponentKitDemo
//
//  Created by Muhammad Hussaan Saeed on 10/7/21.
//

import UIKit
import ComponentKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ComponentKit.Integration.testIntegration()
        
        let viewController = MainRouter.assembleMainModule()
        let navigationController = UINavigationController(rootViewController: viewController)        
        let window = UIWindow()
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

