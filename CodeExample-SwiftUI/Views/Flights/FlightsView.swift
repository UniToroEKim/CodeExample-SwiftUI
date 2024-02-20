//
//  FlightsView.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import SwiftUI

struct FlightsView: View {
	@State var model = FlightsViewModel()
	@State private var searchText = ""
	
	var filteredFlights: [Flight] {
		if searchText.isEmpty {
			return model.flights
		} else {
			return model.flights.filter { flight in
				flight.airline.lowercased().contains(searchText.lowercased()) ||
				flight.number.lowercased().contains(searchText.lowercased()) ||
				flight.departureAirport.lowercased().contains(searchText.lowercased()) ||
				flight.arrivalAirport.lowercased().contains(searchText.lowercased()) ||
				(flight.id ?? "").lowercased().contains(searchText.lowercased())
			}
		}
	}
	
    var body: some View {
		List {
			Section {
				ForEach(filteredFlights) { flight in
					VStack(spacing:6) {
						HStack {
							Text(flight.number).bold()
							Spacer()
							Text("\(flight.departureAirport)→\(flight.arrivalAirport)").bold()
						}
						HStack {
							VStack {
								HStack {
									Text("Depart:")
									Text(flight.formDepartureTime).bold()
								}
								// TODO: Figure out if should display date or adjust layout to be for a specific day
								//Text(flight.formDepartureDate).font(.caption)
							}
							Spacer()
							VStack {
								HStack {
									Text("Arrive:")
									Text(flight.formArrivalTime).bold()
								}
								//Text(flight.formArrivalDate).font(.caption)
							}
						}
						HStack {
							Spacer()
							Text(flight.id ?? "").font(.caption).foregroundStyle(.gray)
						}
						
					}
				}
			} header: {
				Text("United Airlines")
			}

		}
		.searchable(text: $searchText)
		.navigationTitle("Flights")
		.onAppear {
			model.startListening()
		}.onDisappear {
			model.cleanup()
		}
    }
}

