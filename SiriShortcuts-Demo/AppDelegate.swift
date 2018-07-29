//
//  AppDelegate.swift
//  SiriShortcuts-Demo
//
//  Created by Markus Stöbe on 28.07.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	//******************************************************************************************************************
	//* MARK: - UserActivity handling
	//******************************************************************************************************************
	func application(_ application: UIApplication, continue userActivity: NSUserActivity,
					 restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
		if userActivity.activityType == "de.macundi.SiriShortcuts-Demo.zeigeFahrplan" {
			if let vc = self.window?.rootViewController as? ViewController {
				vc.showTableFor(userActivity: userActivity)
				return true
			}
		} else if userActivity.activityType == "ZeigeFahrplanIntent" {
			if let intent = userActivity.interaction?.intent as? ZeigeFahrplanIntent,
			   let vc = self.window?.rootViewController as? ViewController {
				vc.showTableFor(intent: intent)
				return true
			}
		}
		return false
	}
}

