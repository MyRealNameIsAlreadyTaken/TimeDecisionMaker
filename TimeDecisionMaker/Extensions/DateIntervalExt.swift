//
//  DateIntervalExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import CalendarKit

extension DateInterval {
	
	func timeString(for date: Date) -> String {
		let locale = Locale.current
		let timeFormat = Keys.DateFormat.time
		
		let timeString = date.format(with: timeFormat, locale: locale)
		return timeString
	}
	
	var dateString: String {
		let locale = Locale.current
		let dateFormat = Keys.DateFormat.date
		
		let startDateString = self.start.format(with: dateFormat, locale: locale)
		let endDateString = self.end.format(with: dateFormat, locale: locale)
		
		let dateString = endDateString == Date.distantFuture.format(with: dateFormat, locale: locale)
			? startDateString + Keys.DateFormat.distantFuture
			: startDateString + (startDateString == endDateString ? "" : " - \(endDateString)")
		
		return dateString
	}
}

