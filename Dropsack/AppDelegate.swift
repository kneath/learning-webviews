//
//  AppDelegate.swift
//  Dropsack
//
//  Created by Kyle Neath on 1/8/15.
//  Copyright (c) 2015 Kyle Neath. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let webView = WebView(frame: self.window.contentView.frame)
        self.window.contentView.addSubview(webView)
        
        let indexFile = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let bridge = WebViewJavascriptBridge(forWebView: webView, handler: {
            data, responseCallback in
            println("Message from Javascript: \(data)")
            responseCallback("Back at ya")
        })
        webView.mainFrameURL = indexFile
        
        bridge.send("Hello!")
        bridge.send("Hello and come back", responseCallback: { responseData in
            println("Coming back!")
        })
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

