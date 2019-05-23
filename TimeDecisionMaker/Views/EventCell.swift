//
//  EventCell.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import UIKit
import EventKit

class EventCell: UITableViewCell {
	
	@IBOutlet private var titleLabel: UILabel?
	@IBOutlet private var startTimeLabel: UILabel?
	@IBOutlet private var endTimeLabel: UILabel?
	@IBOutlet private var dateLabel: UILabel?
	@IBOutlet private var calendarColorView: UIView?
	
	var viewModel: EventCellViewModel? {
		didSet {
			self.fill(with: viewModel)
		}
	}
	
	private func fill(with viewModel: EventCellViewModel?) {
		DispatchQueue.main.async {
			self.titleLabel?.text = viewModel?.title
			self.startTimeLabel?.text = viewModel?.startTimeString
			self.endTimeLabel?.text = viewModel?.endTimeString
			self.dateLabel?.text = viewModel?.dateString
			self.calendarColorView?.backgroundColor = viewModel?.color
		}
	}
}
