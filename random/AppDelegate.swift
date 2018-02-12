//
//  AppDelegate.swift
//  random
//
//  Created by Andrew Foster on 1/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // create shortcutItems if array is empty
        if let array = UIApplication.shared.shortcutItems {
            if array.count == 0 {
                self.createShortcutItemsWithIcons()
                print("First launch")
            } else {
                print("Items are already created!")
            }
        }
        
        // determine whether we've launched from a shortcut item or not
        let item = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem]
        
        if item != nil {
            print("We've launched from a shortcut item: ", (item as AnyObject).localizedTitle)
            
            // if so, have we launched specific view controllers?
            if (item as AnyObject).type == "com.losAngelesBoy.numbers" {
                self.launchVC1()
            }
            
            if (item as AnyObject).type == "com.losAngelesBoy.lists" {
                self.launchVC2()
            }
            
            if (item as AnyObject).type == "com.losAngelesBoy.flip" {
                self.launchVC3()
            }
            
        } else {
            print("We've launched properly.")
        }
        
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
    
    func createShortcutItemsWithIcons() {
        
        // create icons with own images
        let numbers = UIApplicationShortcutIcon.init(templateImageName: "numbers")
        let lists = UIApplicationShortcutIcon.init(templateImageName: "lists")
        let flip = UIApplicationShortcutIcon.init(templateImageName: "flip")
        
        // create dynamic shortcut items
        let item1 = UIMutableApplicationShortcutItem.init(type: "com.losAngelesBoy.numbers", localizedTitle: "Numbers", localizedSubtitle: "random number", icon: numbers, userInfo: nil)
        let item2 = UIMutableApplicationShortcutItem.init(type: "com.losAngelesBoy.lists", localizedTitle: "Lists", localizedSubtitle: "random list item", icon: lists, userInfo: nil)
        let item3 = UIMutableApplicationShortcutItem.init(type: "com.losAngelesBoy.flip", localizedTitle: "Flip Coin", localizedSubtitle: nil, icon: flip, userInfo: nil)
        
        // add all items to an array
        let items = [item1, item2, item3] as Array
        
        // add this array to the potentially existing static UIApplicationShortcutItems
        let existingItems: Array = UIApplication.shared.shortcutItems! as Array
        let updatedItems: Array = existingItems + items
        UIApplication.shared.shortcutItems = updatedItems
        
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        // react to shortcut item selections
        print("A shortcut item was pressed. It was ", shortcutItem.localizedTitle)
        
        // have we launched Deep Link 1?
        if shortcutItem.type == "com.losAngelesBoy.numbers" {
            self.launchVC1()
        }
        
        if shortcutItem.type == "com.losAngelesBoy.lists" {
            self.launchVC2()
        }
        
        if shortcutItem.type == "com.losAngelesBoy.flip" {
            self.launchVC3()
        }
        
    }
    
    func launchVC1 () {
        
        // grab our storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        // and instantiate our navigation controller
        let controller = storyboard.instantiateViewController(withIdentifier: "Numbers")
        
        // make it the root view controller
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
    
    func launchVC2 () {
        
        // grab our storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        // and instantiate our nav controller
        let controller = storyboard.instantiateViewController(withIdentifier: "Lists")
        
        // make it the root view controller
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
    
    func launchVC3 () {
        
        // grab our storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        // and instantiate our nav controller
        let controller = storyboard.instantiateViewController(withIdentifier: "Flip")
        
        // make it the root view controller
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
    
}

