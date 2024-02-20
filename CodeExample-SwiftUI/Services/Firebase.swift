//
//  Firebase.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation

enum FirebaseCollection:String {
	case flights = "Flights"
	
	func callAsFunction() -> String {
		return self.rawValue
	}
}
