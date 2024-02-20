//
//  FlightsService.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation
import Firebase

class FlightService {
	static let shared = FlightService()
	private let db = Firestore.firestore()
	private let flightsCollection = "flights"
	
	private var listener: ListenerRegistration?
	
	func startListening( completion: @escaping ([Flight]) -> Void) {
		let ref = db.collection(FirebaseCollection.flights())
		listener = ref.addSnapshotListener { querySnapshot, error in
			guard let documents = querySnapshot?.documents else {
				print("No documents")
				return
			}
			
			let flights = documents.compactMap { document -> Flight? in
				do {
					let flight = try document.data(as: Flight.self)
					return flight
				} catch {
					print("Error decoding flight: \(error)")
					return nil
				}
			}
			
			
			DispatchQueue.main.async {
				completion(flights)
			}
			
		}
	}
	
	func getFlights(completion: @escaping ([Flight]) -> Void) {
		db.collection(flightsCollection).getDocuments { snapshot, error in
			guard let documents = snapshot?.documents else {
				print("Error fetching documents: \(error)")
				completion([])
				return
			}
			
			let flights = documents.compactMap { document -> Flight? in
				do {
					let flight = try document.data(as: Flight.self)
					return flight
				} catch {
					print("Error decoding flight: \(error)")
					return nil
				}
			}
			
			completion(flights)
		}
	}
	
	func stopListening() {
		listener?.remove()
		listener = nil
	}
}

