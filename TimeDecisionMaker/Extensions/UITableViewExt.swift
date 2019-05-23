//
//  UITableViewExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

extension UITableView {
	
	func register(_ cellClass: AnyClass) {
		self.register(UINib(cellClass), forCellReuseIdentifier: toString(cellClass))
	}
	
	func dequeueReusableCell(withCellClass cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
		return self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)
	}
}
