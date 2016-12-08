//
//  AppDelegate.swift
//  StoryboardPattern
//
//  Created by NAH on 12/8/16.
//  Copyright © 2016 NAH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        validateStoryboards()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

extension AppDelegate {
    func validateStoryboards() {
        guard
            let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.main.rawValue),
            let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.explore.rawValue),
            let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.profile.rawValue),
            let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.search.rawValue)
            else {
                fatalError("fail to init storyboard by name")
        }
        
        guard let _ = HomeViewController.instanceFromStoryboard(),
            let _ = ExploreViewController.instanceFromStoryboard(),
            let _ = ProfileViewController.instanceFromStoryboard(),
            let _ = SearchViewController.instanceFromStoryboard()
            else {
                fatalError("fail to init controller from storyboard")
        }
    }
}

