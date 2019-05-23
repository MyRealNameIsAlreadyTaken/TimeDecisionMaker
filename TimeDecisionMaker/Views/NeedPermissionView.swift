//
//  NeedPermissionView.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

class NeedPermissionView: UIView, NibLoading {
	
	@IBOutlet private var permissionLabel: UILabel?
	@IBOutlet private var goToSettingsButton: UIButton?
	
	@IBAction func goToSettings(_ sender: UIButton) {
		guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
			return
		}
		
		UIApplication.shared.open(settingsUrl)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.translatesAutoresizingMaskIntoConstraints = false
		self.permissionLabel?.text = Keys.PermissionView.labelText
		self.goToSettingsButton?.setTitle(Keys.PermissionView.buttonText, for: .normal)
	}
	
	func fadeIn() {
		DispatchQueue.main.async {
			UIView.animate(withDuration: 1.0) {
				self.permissionLabel?.alpha = 1.0
				self.goToSettingsButton?.alpha = 1.0
			}
		}
	}
}
