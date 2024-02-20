//
//  DateFormatterUtil.swift
//  CodeExample-SwiftUI
//
//  Created by Edward Kim on 2/19/24.
//

import Foundation

// Reduce creating multiple dateformatters
class DateFormatterUtil {
	static let shared = DateFormatterUtil()
	
	private let formatter = DateFormatter()
	
	init() {
		// Set a default date format
		formatter.dateFormat = "EEEE, MMMM d, yyyy hh:mm a"
	}
	
	func long(_ date: Date) -> String {
		formatter.dateFormat = "EEEE, MMMM d, yyyy hh:mm a"
		return formatter.string(from: date)
	}
	
	func medium(_ date: Date) -> String {
		formatter.dateFormat = "MMM d, yyyy hh:mm a"
		return formatter.string(from: date)
	}
	
	func short(_ date: Date) -> String {
		formatter.dateFormat = "EEE, MMM d"
		return formatter.string(from: date)
	}
	
	func time(_ date: Date) -> String {
		formatter.dateFormat = "hh:mm a"
		return formatter.string(from: date)
	}
}

class NumberFormatterUtil {
	static let shared = NumberFormatterUtil()
	
	private let formatter = NumberFormatter()
	
	init() {
		formatter.numberStyle = .decimal
		formatter.locale = Locale(identifier: "en_US_POSIX")
	}
	
	func year(_ number: Int) -> String? {
		return formatter.string(from: NSNumber(value: number))
	}
}
