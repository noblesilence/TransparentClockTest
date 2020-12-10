//
//  AppDelegate.swift
//  TransparentClockTest
//
//  Created by Aye Aye Mon on 12/10/20.
//  Copyright © 2020 LTC Clock. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    let viewController = ViewController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = viewController
        window.isOpaque = false
        window.backgroundColor = NSColor.clear
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

