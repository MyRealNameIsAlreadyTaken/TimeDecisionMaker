//
//  EventExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import CalendarKit

extension Event {
	
	convenience init(text: String, startDate: Date, endDate: Date) {
		self.init()
		self.text = text
		self.startDate = startDate
		self.endDate = endDate
	}
}
