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
	var plane:Plane?
	
	private var flightService = FlightService.shared
	private var planService = PlaneService.shared

	deinit {
		cleanup()
	}
	
	
	func startListening() {
		flightService.startListening { flights in
			self.flights = flights
		}
	}
	
	func getPlane(planeID:String) {
		planService.getPlane(planeID: planeID) { plane in
			self.plane = plane
		}
	}
	
	// Call this function when the UserViewModel is no longer needed to prevent memory leaks
	func cleanup() {
		flightService.stopListening()
	}
	
	
}
