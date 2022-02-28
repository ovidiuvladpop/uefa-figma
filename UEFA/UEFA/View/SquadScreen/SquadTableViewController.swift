//
//  SquadTableViewController.swift
//  UEFA
//
//  Created by Ovidiu Pop on 28.02.2022.
//

import UIKit

class SquadTableViewController: UITableViewController {
        
    private var viewModel: SquadViewModelProtocol
    
    // MARK: Init
    
    init(viewModel: SquadViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: Private
    
    private func setupTableView() {
        SquadTableViewCell.register(tableView: tableView)
        tableView.backgroundColor = viewModel.tableViewBackgroundColor()
    }
}

extension SquadTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.cellIdentifier, for: indexPath) as? SquadTableViewCell else { return UITableViewCell() }
        let cellViewModel = viewModel.squadCellViewModel(for: indexPath)
        cell.setup(viewModel: cellViewModel)
        cell.contentView.backgroundColor = viewModel.squadCellBackgroundColor()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let squadHeaderView = SquadTableViewHeader()
        squadHeaderView.setHeader(name: viewModel.titleForHeader(in: section), backgroundColor: viewModel.squadHeaderBackgroundColor())
        
        return squadHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UEFAConsts.SquadDetails.squadTableViewHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.isLastCell(from: indexPath) ? UEFAConsts.SquadDetails.squadTableViewCellExtendedHeight : UEFAConsts.SquadDetails.squadTableViewCellDefaultHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        viewModel.isLastSection(section) ? UEFAConsts.SquadDetails.squadTableViewFooterExtendedHeight : UEFAConsts.SquadDetails.squadTableViewFooterDefaultHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: view.bounds)
        footerView.backgroundColor = viewModel.squadFooterBackgroundColor()
        
        return footerView
    }
}
