//
//  Plane.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Plane: Identifiable, Codable {
	@DocumentID var id: String?
	var make: String
	var model: String
	var capacity: Int
	var year: Int
}
