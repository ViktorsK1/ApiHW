//
//  AppDelegate.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow.init(frame: UIScreen.main.bounds)
            let currentVC = PostListVC()
            let navigationVC = UINavigationController(rootViewController: currentVC)
            navigationVC.navigationBar.shadowImage = UIImage()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            navigationVC.modalPresentationStyle = .fullScreen
            
            window?.rootViewController = navigationVC
            window?.makeKeyAndVisible()
            return true       
    }

}

