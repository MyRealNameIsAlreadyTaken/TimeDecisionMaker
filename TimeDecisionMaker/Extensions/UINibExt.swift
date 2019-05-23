//
//  UINibExt.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit

extension UINib {
	convenience init(_ viewClass: AnyClass, bundle: Bundle? = nil) {
		self.init(nibName: toString(viewClass), bundle: bundle)
	}
}
