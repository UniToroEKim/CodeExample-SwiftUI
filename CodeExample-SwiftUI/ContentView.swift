//
//  ContentView.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import SwiftUI

enum FlightRouter: Hashable {
	case flightDetails(String)
}

struct ContentView: View {
	@State var model = FlightsViewModel()
	
	var body: some View {
		NavigationStack {
			FlightsView()
				.environment(model)
				.navigationDestination(for: FlightRouter.self){ route in
					switch route {
					case let .flightDetails(planeID):
						FlightDetailsView(planeID: planeID)
							.environment(model)
					}
				}
		}

	}
	
}
