//
//  AppDelegate.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let networkRepositoryImpl = NetworkRepositoryImpl()
        let viewController = ViewController(networkRepository: networkRepositoryImpl)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return true
    }
}

