//
//  CalendarManager.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import EventKitUI

class CalendarManager: NSObject {
	
	weak var delegate: CalendarManagerDelegate?
	private let eventStore: EKEventStore
	
	override init() {
		self.eventStore = EKEventStore()
		super.init()
	}
	
	func checkCalendarAuthorizationStatus() {
		let status = EKEventStore.authorizationStatus(for: .event)
		
		switch status {
		case .notDetermined:
			requestCalendarAccess()
		case .authorized:
			self.showCalendarChooser()
		case .restricted, .denied:
			self.delegate?.needPermissionView?.fadeIn()
		}
	}
	
	func events(from calendarChooser: EKCalendarChooser) -> [EKEvent] {
		let calendar = Calendar.current
		let selectedCalendars = calendarChooser.selectedCalendars
		
		guard let yearAgo = calendar.date(byAdding: .year, value: -1, to: Date()),
			let yearFromNow = calendar.date(byAdding: .year, value: 1, to: Date()) else {
				return []
		}
		
		let predicate = self.eventStore.predicateForEvents(withStart: yearAgo, end: yearFromNow, calendars: Array(selectedCalendars))
		
		let events = self.eventStore.events(matching: predicate)
		
		return events
	}
	
	private func requestCalendarAccess() {
		self.eventStore.requestAccess(to: .event) { isAccessGranted, error in
			if isAccessGranted {
				self.showCalendarChooser()
			} else {
				self.delegate?.needPermissionView?.fadeIn()
			}
		}
	}
	
	private func showCalendarChooser() {
		
		let calendarChooser = EKCalendarChooser(selectionStyle: .multiple, displayStyle: .allCalendars, entityType: .event, eventStore: self.eventStore)
		calendarChooser.showsDoneButton = true
		calendarChooser.delegate = self
		
		self.delegate?.calendarManager(self, didFinishMaking: calendarChooser)
	}
}

extension CalendarManager: EKCalendarChooserDelegate {
	
	func calendarChooserDidFinish(_ calendarChooser: EKCalendarChooser) {
		
		self.delegate?.calendarManager(self, didDismiss: calendarChooser)
	}
}
