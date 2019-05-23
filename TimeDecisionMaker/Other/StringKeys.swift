//
//  StringKeys.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

struct Keys {
	
	struct NavigationItem {
		static let eventList = "Event list"
		static let calendars = "Calendars"
		static let freeSlots = "Free Slots"
	}
	
	struct Calendars {
		static let A = "A"
		static let B = "B"
		static let `extension` = "ics"
		static let allDay = "all day"
	}
	
	struct DateFormat {
		static let date = "dd.MM.YYYY"
		static let time = "HH:mm"
		static let distantFuture = " - To Infinity ... and Beyond!"
	}
	
	struct FatalError {
		static let noInit = "init(coder:) has not been implemented"
	}
	
	struct TestFail {
		static let noTestFiles = "Test files should exist"
		static let noAppointments = "At least one appointment should exist"
	}
	
	struct Duration {
		static let day: TimeInterval = 24 * 60 * 60
		static let hour: TimeInterval = 3_600
	}
	
	struct PermissionView {
		static let labelText = "This app needs calendar permission for proper work"
		static let buttonText = "Go to Settings"
	}
	
	struct TableView {
		static let rowHeight: CGFloat = 70.0
	}
}
