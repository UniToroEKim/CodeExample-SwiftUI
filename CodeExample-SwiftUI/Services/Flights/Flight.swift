//
//  Flights.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Flight: Identifiable, Codable {
	@DocumentID var id: String?
	var airline: String
	var number: String
	var departureAirport: String
	var arrivalAirport: String
	var departureTime: Date
	var arrivalTime: Date
	var formDepartureDate: String { DateFormatterUtil.shared.short(departureTime) }
	var formArrivalDate: String { DateFormatterUtil.shared.short(arrivalTime) }
	var formDepartureTime: String { DateFormatterUtil.shared.time(departureTime) }
	var formArrivalTime: String { DateFormatterUtil.shared.time(arrivalTime) }
}
