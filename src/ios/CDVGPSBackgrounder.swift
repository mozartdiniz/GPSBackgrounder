//
//  CDVNativeSoma.swift
//  TheBackgrounder
//
//  Created by Mozart Diniz on 8/19/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Foundation

@objc(HWPGPSBackgrounder) class CDVGPSBackgrounder : CDVPlugin, CLLocationManagerDelegate {
    
    var com : CDVInvokedUrlCommand!

    lazy var locationManager: CLLocationManager! = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        return manager
        }()
    
    
    func initialize(command: CDVInvokedUrlCommand) {
        
        com = command
        
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func start(command: CDVInvokedUrlCommand) {

        locationManager.startUpdatingLocation()

        var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func stop(command: CDVInvokedUrlCommand) {

        locationManager.stopUpdatingLocation()

        var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        NSLog("App is backgrounded. New location is %@", newLocation)
        NSLog("callbackId %@", com.callbackId)
        
        let coordinate : CLLocationCoordinate2D = newLocation.coordinate

        var script = "GPSBackgrounder.onPosition({latitude:\(coordinate.latitude), longitude: \(coordinate.longitude), speed: \(newLocation.speed), timestamp: '\(newLocation.timestamp)', accuracy: \(newLocation.horizontalAccuracy)})";
        
        webView.stringByEvaluatingJavaScriptFromString(script)
        
    }

}
