//
//  TimeDecisionMakerTests.swift
//  TimeDecisionMakerTests
//
//  Created by Mikhail on 4/24/19.
//

import XCTest
@testable import TimeDecisionMaker

class TimeDecisionMakerTests: XCTestCase {
	
	lazy var organizerFilePath: String? = Bundle.main.path(forResource: Keys.Calendars.A, ofType: Keys.Calendars.extension)
	lazy var attendeeFilePath: String? = Bundle.main.path(forResource: Keys.Calendars.B, ofType: Keys.Calendars.extension)
	lazy var parser = CalendarParser()
	
	func testVeryLongAppointment() {
		let decisionMaker = RDTimeDecisionMaker(parser: parser)
		guard let orgPath = organizerFilePath, let attendeePath = attendeeFilePath else {
			XCTFail(Keys.TestFail.noTestFiles)
			return
		}
		XCTAssertNotEqual([],
						  decisionMaker.suggestAppointments(organizerICS: orgPath,
															attendeeICS: attendeePath,
															duration: Keys.Duration.day))
	}
	
	// now this test failing, it should not fail
	func testAtLeastOneHourAppointmentExist() {
		let decisionMaker = RDTimeDecisionMaker(parser: parser)
		guard let orgPath = organizerFilePath, let attendeePath = attendeeFilePath else {
			XCTFail(Keys.TestFail.noTestFiles)
			return
		}
		XCTAssertNotEqual(0,
						  decisionMaker.suggestAppointments(organizerICS: orgPath,
															attendeeICS: attendeePath,
															duration: Keys.Duration.hour).count,
						  Keys.TestFail.noAppointments)
	}
}
