//
//  IntentHandler.swift
//  FahrplanIntentsExtension
//
//  Created by Markus Stöbe on 05.08.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Intents

class IntentHandler: INExtension, ZeigeFahrplanIntentHandling {
	func confirm(intent: ZeigeFahrplanIntent, completion: @escaping (ZeigeFahrplanIntentResponse) -> Void) {
		//make sure all parameters needed are present and you can handle the intent
		//then send feedback back to Siri/iOS
		let response = ZeigeFahrplanIntentResponse(code: .ready, userActivity: nil)
		completion(response)
	}
	
	
	func handle(intent: ZeigeFahrplanIntent, completion: @escaping (ZeigeFahrplanIntentResponse) -> Void) {
		//load table from internet
		let response = ZeigeFahrplanIntentResponse(code: .success, userActivity: nil)
		response.zeitBisAbfahrt = "27 Minuten"
		completion(response)
	}
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }

	
}
