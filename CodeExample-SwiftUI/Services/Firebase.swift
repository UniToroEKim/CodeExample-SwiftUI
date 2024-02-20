//
//  Firebase.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation

enum FIRCollection:String {
	case flights = "Flights"
	case planes = "Planes"
	
	func callAsFunction() -> String {
		return self.rawValue
	}
}
