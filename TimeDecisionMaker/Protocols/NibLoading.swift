//
//  NibLoading.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import Foundation

import UIKit

protocol NibLoading {
	
	static func fromNib() -> Self?
}

extension NibLoading {
	
	static func fromNib() -> Self? {
		let view = UINib(nibName: String(describing: self), bundle: nil)
			.instantiate(withOwner: nil)
			.first as? Self
		
		return view
	}
}
