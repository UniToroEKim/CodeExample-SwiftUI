//
//  FlightsViewModel.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import SwiftUI
import Observation

@Observable class FlightsViewModel {
	var flights:[Flight] = []
	
	private var flightService = FlightService.shared
	
	func startListening() {
		flightService.startListening { flights in
			self.flights = flights
		}
	}

	deinit {
		cleanup()
	}
	
	// Call this function when the UserViewModel is no longer needed to prevent memory leaks
	func cleanup() {
		flightService.stopListening()
	}
	
}
