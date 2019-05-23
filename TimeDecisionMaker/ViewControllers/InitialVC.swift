//
//  InitialVC.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import EventKitUI

class InitialVC: UIViewController {
	
	private let calendarManager: CalendarManager
	private var presentingNavigationVC: UINavigationController?
	
	init(calendarManager: CalendarManager) {
		self.calendarManager = calendarManager
		super.init(nibName: nil, bundle: nil)
		self.calendarManager.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError(Keys.FatalError.noInit)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.calendarManager.checkCalendarAuthorizationStatus()
	}
}

extension InitialVC: CalendarManagerDelegate {
	
	var needPermissionView: NeedPermissionView? {
		guard let needPermissionView = NeedPermissionView.fromNib() else {
			return nil
		}
		
		self.view.add(needPermissionView).constraint(to: self.view)
		return needPermissionView
	}
	
	func calendarManager(_ calendarManager: CalendarManager, didFinishMaking calendarChooser: EKCalendarChooser) {
		let navigationVC = UINavigationController(rootViewController: calendarChooser)
		self.presentingNavigationVC = navigationVC
		self.navigationController?.present(navigationVC, animated: false)
	}
	
	func calendarManager(_ calendarManager: CalendarManager, didDismiss calendarChooser: EKCalendarChooser) {
		let events = self.calendarManager.events(from: calendarChooser)
		let eventListVC = EventListVC(events: events)
		self.presentingNavigationVC?.pushViewController(eventListVC, animated: true)
	}
}
