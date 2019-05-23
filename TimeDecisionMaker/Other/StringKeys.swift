//
//  StringKeys.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import Foundation

struct Keys {
	
	struct Calendars {
		static let A = "A"
		static let B = "B"
		static let `extension` = "ics"
	}
	
	struct TestFail {
		static let noTestFiles = "Test files should exist"
		static let noAppointments = "At least one appointment should exist"
	}
	
	struct Duration {
		static let day: TimeInterval = 24 * 60 * 60
		static let hour: TimeInterval = 3_600
	}
}
