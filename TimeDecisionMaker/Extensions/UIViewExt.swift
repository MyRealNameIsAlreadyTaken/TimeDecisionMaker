//
//  UIViewExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

extension UIView {
	
	func add(_ view: UIView) -> UIView {
		self.addSubview(view)
		return view
	}
	
	func constraint(leading: Bool = true, top: Bool = true, trailing: Bool = true, bottom: Bool = true,
					to view: UIView,
					constant: CGFloat = 0.0) {
		self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = leading
		self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = top
		self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = trailing
		self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = bottom
	}
}
