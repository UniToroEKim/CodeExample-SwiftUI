//
//  FlightDetailsView.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import SwiftUI

struct FlightDetailsView: View {
	@Environment(FlightsViewModel.self) var model
	var planeID:String
	
    var body: some View {
		List {
			LabeledContent {
				Text(model.plane?.make ?? "--")
			} label: {
				Text("Make")
			}
			LabeledContent {
				Text(model.plane?.model ?? "--")
			} label: {
				Text("Model")
			}
			LabeledContent {
				Text("\(model.plane?.capacity ?? 0)")
			} label: {
				Text("Capacity")
			}
			LabeledContent {
				Text("\(model.plane?.year ?? 0)")
			} label: {
				Text("Year")
			}

		}
		.navigationTitle("Details")
		.onAppear{
			model.getPlane(planeID: planeID)
		}
    }
}

