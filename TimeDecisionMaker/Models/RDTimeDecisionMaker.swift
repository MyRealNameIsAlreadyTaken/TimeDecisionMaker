//
//  RDTimeDecisionMaker.swift
//  TimeDecisionMaker
//
//  Created by Mikhail on 4/24/19.
//

import Foundation

class RDTimeDecisionMaker: NSObject {
	
	let parser: CalendarParser
	
	init(parser: CalendarParser) {
		self.parser = parser
		super.init()
	}
	
	/// Main method to perform date interval calculation
	///
	/// - Parameters:
	///   - organizerICSPath: path to personA file with events
	///   - attendeeICSPath: path to personB file with events
	///   - duration: desired duration of appointment
	/// - Returns: array of available time slots, empty array if none found
	func suggestAppointments(organizerICS: String,
							 attendeeICS: String,
							 duration: TimeInterval) -> [DateInterval] {
		let organizerFreeSlots = self.parser.parse(organizerICS).freeSlots()
		let attendeeFreeSlots = self.parser.parse(attendeeICS).freeSlots()
		
		return (DateInterval.intersection <§> organizerFreeSlots <*> attendeeFreeSlots).filter {
			$0.start != $0.end
				&& ($0.end.timeIntervalSinceNow - $0.start.timeIntervalSinceNow) >= duration
		}
	}
}
