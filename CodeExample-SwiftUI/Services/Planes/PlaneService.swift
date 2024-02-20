//
//  PlaneService.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation
import Firebase

class PlaneService {
	static let shared = PlaneService()
	private let db = Firestore.firestore()
	
	func getPlanes(completion: @escaping ([Plane]) -> Void) {
		db.collection(FIRCollection.flights()).getDocuments { snapshot, error in
			guard let documents = snapshot?.documents else {
				print("Error fetching documents: \(String(describing: error))")
				completion([])
				return
			}
			
			let planes = documents.compactMap { document -> Plane? in
				do {
					let plane = try document.data(as: Plane.self)
					return plane
				} catch {
					print("Error decoding flight: \(error)")
					return nil
				}
			}
			
			completion(planes)
		}
	}
	
	func getPlane(planeID: String, completion: @escaping (Plane?) -> Void) {
		db.collection(FIRCollection.planes()).document(planeID).getDocument { snapshot, error in
			guard error == nil else {
				print("Error fetching document: \(String(describing: error))")
				DispatchQueue.main.async {
					completion(nil)
				}
				return
			}
			
			do {
				let plane = try snapshot?.data(as: Plane.self)
				DispatchQueue.main.async {
					completion(plane)
				}
			} catch {
				print("Error decoding plane: \(error)")
				DispatchQueue.main.async {
					completion(nil)
				}
			}
		}
	}


	
}
