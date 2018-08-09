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
		
		completion(ZeigeFahrplanIntentResponse(code: .ready, userActivity: nil))
	}
	
	
	func handle(intent: ZeigeFahrplanIntent, completion: @escaping (ZeigeFahrplanIntentResponse) -> Void) {
		//load table from internet
		
		completion(ZeigeFahrplanIntentResponse(code: .success, userActivity: nil))
	}
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }

	
}
