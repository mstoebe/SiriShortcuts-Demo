//
//  IntentHandler.swift
//  FahrplanIntentsExtension
//
//  Created by Markus Stöbe on 05.08.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Intents

class IntentHandler: INExtension, ZeigeFahrplanIntentHandling {
	func handle(intent: ZeigeFahrplanIntent, completion: @escaping (ZeigeFahrplanIntentResponse) -> Void) {
		<#code#>
	}

    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }

	
}
