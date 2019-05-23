//
//  FreeSlotsVC.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import CalendarKit

class FreeSlotsVC: DayViewController {
	
	private let timeDecisionMaker = RDTimeDecisionMaker(parser: CalendarParser())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = Keys.NavigationItem.freeSlots
	}
	
	override func eventsForDate(_ date: Date) -> [EventDescriptor] {
		guard let organizerFilePath = Bundle.main.path(forResource: Keys.Calendars.A, ofType: Keys.Calendars.extension), let attendeeFilePath = Bundle.main.path(forResource: Keys.Calendars.B, ofType: Keys.Calendars.extension) else {
			return []
		}
		
		return self.timeDecisionMaker.suggestAppointments(organizerICS: organizerFilePath,
														  attendeeICS: attendeeFilePath,
														  duration: 0)
			.map { $0.toEvent() }
	}
}
