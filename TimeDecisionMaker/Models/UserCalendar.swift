//
//  UserCalendar.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import Foundation

import Foundation

struct UserCalendar {
	
	private(set) var appointments: [Appointment]
	
	func freeSlots() -> [DateInterval] {
		guard let last = self.appointments.last else {
			return []
		}
		
		let currentDate = Date()
		let lastAppointmentStartDate = max(currentDate, last.endDate)
		let afterLastAppointmentInterval = DateInterval(start: lastAppointmentStartDate, end: Date.distantFuture)
		
		var freeSlotStart = currentDate
		//		 NOTE: - If the API would allow TRANSP: attribute access, we'd weed out appointments with "free" availability
		//		 Just like all day apps in the example
		return self.appointments
			//			.filter { !$0.isAvailable && $0.endDate > currentDate }
			.filter { $0.endDate > currentDate }
			.reduce([]) { intervals, appointment in
				defer {
					freeSlotStart = appointment.endDate
				}
				
				return intervals + (freeSlotStart > appointment.startDate
					? []
					: [DateInterval(start: freeSlotStart, end: appointment.startDate)])
			}
			+ [afterLastAppointmentInterval]
	}
}
