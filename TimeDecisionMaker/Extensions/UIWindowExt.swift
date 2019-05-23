//
//  UIWindowExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

extension UIWindow {
	
	class func make(withRoot rootViewController: UIViewController) -> UIWindow {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.backgroundColor = .white
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()
		return window
	}
}
