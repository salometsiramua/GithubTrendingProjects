//
//  AppDelegate.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         window = UIWindow(frame: UIScreen.main.bounds)
         let navigationController = AppNavigationController.init()
         appCoordinator = AppCoordinator(navigationController: navigationController)
         appCoordinator!.start()
         window!.rootViewController = navigationController
         window!.makeKeyAndVisible()
         return true
     }
}
