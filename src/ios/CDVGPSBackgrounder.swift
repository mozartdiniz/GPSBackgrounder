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

@available(iOS 8.0, *)
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
        
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate!.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func start(command: CDVInvokedUrlCommand) {

        locationManager.startUpdatingLocation()

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate!.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func stop(command: CDVInvokedUrlCommand) {

        locationManager.stopUpdatingLocation()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate!.sendPluginResult(pluginResult, callbackId: command.callbackId)

    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation) {

        let coordinate : CLLocationCoordinate2D = newLocation.coordinate

        let script = "GPSBackgrounder.onPosition({latitude:\(coordinate.latitude), longitude: \(coordinate.longitude), speed: \(newLocation.speed), timestamp: '\(newLocation.timestamp)', accuracy: \(newLocation.horizontalAccuracy)})";
        
        webView!.stringByEvaluatingJavaScriptFromString(script)
        
    }

}
