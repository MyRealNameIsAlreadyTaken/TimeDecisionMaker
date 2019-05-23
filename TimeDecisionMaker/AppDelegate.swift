//
//  AppDelegate.swift
//  TimeDecisionMaker
//
//  Created by Mikhail on 4/24/19.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	private let calendarManager = CalendarManager()
	private lazy var initialVC = InitialVC(calendarManager: calendarManager)
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let navigationVC = UINavigationController(rootViewController: initialVC)
		
		self.window = UIWindow.make(withRoot: navigationVC)
		return true
	}
}
