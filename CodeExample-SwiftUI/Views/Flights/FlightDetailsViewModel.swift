//
//  FlightDetailsViewModel.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation
import Observation

@Observable class FlightDetailsViewModel {
	var plane:Plane?
	
	private var planService = PlaneService.shared

	func getPlane(planeID:String) {
		planService.getPlane(planeID: planeID) { plane in
			self.plane = plane
		}
	}
	
}
