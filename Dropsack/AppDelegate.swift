//
//  AppDelegate.swift
//  Dropsack
//
//  Created by Kyle Neath on 1/8/15.
//  Copyright (c) 2015 Kyle Neath. All rights reserved.
//

import Cocoa
import WebKit;

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let webView = WebView(frame: self.window.contentView.frame)
        self.window.contentView.addSubview(webView)
        webView.frameLoadDelegate = self;
        
        let indexFile = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let indexString = NSString(contentsOfFile: indexFile!, encoding: NSUTF8StringEncoding, error: nil)
        webView.mainFrame.loadHTMLString(indexString, baseURL: nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

