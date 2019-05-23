//
//  EventCellViewModel.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit
import EventKit

struct EventCellViewModel {
	
	private let event: EKEvent
	
	let title: String
	let startTimeString: String
	let endTimeString: String
	let dateString: String
	let color: UIColor?
	
	init(event: EKEvent) {
		self.event = event
		let eventDateInterval = DateInterval(start: event.startDate, end: event.endDate)
		let cgColor = event.calendar.cgColor
		
		self.title = event.title ?? ""
		self.startTimeString = event.isAllDay
			? Keys.Calendars.allDay
			: eventDateInterval.timeString(for: eventDateInterval.start)
		self.endTimeString = event.isAllDay
			? ""
			: eventDateInterval.timeString(for: eventDateInterval.end)
		self.dateString = eventDateInterval.dateString
		self.color = UIColor.init(cgColor:) <§> cgColor
	}
}

