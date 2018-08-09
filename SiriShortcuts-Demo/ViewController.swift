//
//  ViewController.swift
//  SiriShortcuts-Demo
//
//  Created by Markus Stöbe on 28.07.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

	@IBOutlet weak var labelHaltestelle: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		createAndDonateShortcut()
		createAndDonateIntent()
	}

	//******************************************************************************************************************
	//* MARK: - Create and Donate a NSUserActivity
	//******************************************************************************************************************
	func createAndDonateShortcut() {
		//create
		let userActivity = NSUserActivity(activityType: "de.macundi.SiriShortcuts-Demo.zeigeFahrplan")
		userActivity.isEligibleForSearch     = true  //ohne search, keine prediction, also muss dies hier immer true sein
		userActivity.isEligibleForHandoff    = false //Handoff ist separat und damit für uns kmplett optional
		userActivity.isEligibleForPrediction = true  //dies ist der wichtige Punkt! Ohne prediction, kein Siri!
		userActivity.title    = "Fahrplan für Zuhause"
		userActivity.userInfo = ["Haltestelle":"Alte Kirche"]
		userActivity.requiredUserInfoKeys = ["Haltestelle"]
		userActivity.suggestedInvocationPhrase = "Zeig mir den Fahrplan für Zuhause"

		//donate
		self.userActivity = userActivity
	}

	//******************************************************************************************************************
	//* MARK: - create and donate an intent
	//******************************************************************************************************************
	func createAndDonateIntent () {
		let myIntent = ZeigeFahrplanIntent()
		myIntent.haltestelle = ""
		myIntent.suggestedInvocationPhrase = "Wann fährt der nächste Bus?"

		let interaction = INInteraction(intent: myIntent, response: nil)
		interaction.donate { error in
			//error-handling
		}
	}

	//******************************************************************************************************************
	//* MARK: - receive and handle requests from iOS/Siri once user activated it
	//******************************************************************************************************************
	func showTableFor(userActivity:NSUserActivity) {
		if let haltestelle = userActivity.userInfo?["Haltestelle"] as? String {
			labelHaltestelle.text = haltestelle
		} else {
			labelHaltestelle.text = "da ging was schief"
		}
	}

	func showTableFor(intent: ZeigeFahrplanIntent) {
		if let name = intent.haltestelle {
			labelHaltestelle.text = name
		}
	}


}


