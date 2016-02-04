//
//  AppDelegate.swift
//  Teacher Solutions Events
//
//  Created by Aidan Cornelius-Bell on 4/02/2016.
//  Copyright © 2016 Teacher Solutions, Pty Ltd. All rights reserved.
//

import UIKit
import SafariServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // set up your background color view
        let colorView = UIView()
        colorView.backgroundColor = UIColor.init(red: 201/255, green: 178/255, blue: 198/255, alpha: 1)
        
        // use UITableViewCell.appearance() to configure
        // the default appearance of all UITableViewCells in your app
        UITableViewCell.appearance().selectedBackgroundView = colorView
        
        
        let launchApp = UIApplicationShortcutItem(type: "viewevents", localizedTitle: "View Events")
        let launchSFSV = UIApplicationShortcutItem(type: "registernow", localizedTitle: "Register Now")
        
        UIApplication.sharedApplication().shortcutItems = [launchApp, launchSFSV]
        
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: Bool -> Void) {
        //Here you are going to want to use the shortcutItem parameter.
        print(shortcutItem.type, "... hello 3d touch enabled golden child.")
        if (shortcutItem.type == "registernow") {
            let svc = SFSafariViewController(URL: NSURL(string: "https://www.teachersolutions.com.au/events")!)
            self.window?.rootViewController?.presentViewController(svc, animated: false, completion: nil)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

