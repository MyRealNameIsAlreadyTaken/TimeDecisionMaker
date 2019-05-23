//
//  EventListVC.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import EventKitUI

class EventListVC: UIViewController {
	
	private let events: [EKEvent]
	private let tableView = UITableView()
	
	init(events: [EKEvent]) {
		self.events = events
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError(Keys.FatalError.noInit)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setupTableView()
		self.setupNavigationItem()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.tableView.reloadData()
	}
	
	@objc private func presentFreeSlotsVC() {
		let freeSlotsVC = FreeSlotsVC()
		navigationController?.pushViewController(freeSlotsVC, animated: true)
	}
	
	private func setupTableView() {
		self.tableView.register(EventCell.self)
		self.tableView.dataSource = self
		self.tableView.delegate = self
		
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.view.add(self.tableView).constraint(to: self.view)
	}
	
	private func setupNavigationItem() {
		self.navigationItem.title = Keys.NavigationItem.eventList
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: Keys.NavigationItem.calendars,
																style: .plain,
																target: self.navigationController,
																action: #selector(self.navigationController?.popViewController(animated:)))
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Keys.NavigationItem.freeSlots,
																 style: .done,
																 target: self,
																 action: #selector(self.presentFreeSlotsVC))
	}
}

extension EventListVC: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.events.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let event = self.events[indexPath.row]
		let cell = tableView.dequeueReusableCell(withCellClass: EventCell.self, for: indexPath) as? EventCell
		let cellViewModel = EventCellViewModel(event: event)
		cell?.viewModel = cellViewModel
		
		return cell ?? UITableViewCell()
	}
}

extension EventListVC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Keys.TableView.rowHeight
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let event = self.events[indexPath.row]
		
		let eventDetailVC = self.makeEventDetailVC(with: event)
		
		let navigationVC = UINavigationController(rootViewController: eventDetailVC)
		self.present(navigationVC, animated: true)
	}
	
	private func makeEventDetailVC(with event: EKEvent) -> EKEventViewController {
		let eventDetailVC = EKEventViewController()
		eventDetailVC.delegate = self
		eventDetailVC.allowsEditing = true
		eventDetailVC.event = event
		
		return eventDetailVC
	}
}

extension EventListVC: EKEventViewDelegate {
	
	func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
		controller.dismiss(animated: true)
	}
}
