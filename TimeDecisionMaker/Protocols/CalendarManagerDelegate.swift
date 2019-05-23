//
//  CalendarManagerDelegate.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import EventKitUI

protocol CalendarManagerDelegate: class {
	
	var needPermissionView: NeedPermissionView? { get }
	
	func calendarManager(_ calendarManager: CalendarManager, didFinishMaking calendarChooser: EKCalendarChooser)
	func calendarManager(_ calendarManager: CalendarManager, didDismiss calendarChooser: EKCalendarChooser)
}
