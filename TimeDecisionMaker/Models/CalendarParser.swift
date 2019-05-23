//
//  CalendarParser.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import MXLCalendarManager

struct CalendarParser {
	
	private let mxlManager = MXLCalendarManager()
	
	func parse(_ icsPath: String) -> UserCalendar {
		var events = [MXLCalendarEvent]()
		
		self.mxlManager.scanICSFile(atLocalPath: icsPath) { calendar, error in
			events = calendar?.events as? [MXLCalendarEvent] ?? []
		}
		
		return UserCalendar.init § self.eventToAppointment <§> events
	}
	
	private func eventToAppointment(_ event: MXLCalendarEvent) -> Appointment {
		return Appointment(uid: event.eventUniqueID,
						   title: event.eventSummary,
						   startDate: event.eventStartDate,
						   endDate: event.eventEndDate)
	}
}
