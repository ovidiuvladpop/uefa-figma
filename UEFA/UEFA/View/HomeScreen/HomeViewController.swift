//
//  HomeViewController.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var headerContentView: HeaderView!
    @IBOutlet weak var tabsContentView: TabsView!
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    private var viewModel: HomeViewModelProtocol
    
    // MARK: Lifecycle
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTargets()
        setupHeaderView()
        setupTabsView()
        setupTableView()
    }
    
    // MARK: Private
    
    private func addTargets() {
        headerContentView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        tabsContentView.actionButtons.forEach { actionButton in
            actionButton.addTarget(self, action: #selector(tabButtonPressed(sender:)), for: .touchUpInside)
        }
    }
    
    private func setupHeaderView() {
        guard let backgroundImage = viewModel.backgroundImage() else { return }
        headerContentView.setBackground(image: backgroundImage)
        headerContentView.playingLabel.text = UEFAConsts.HomeScreen.playingLabel
        headerContentView.descriptionLabel.text = UEFAConsts.HomeScreen.roundDescriptionLabel
        headerContentView.teamNameLabel.text = viewModel.teamName()
    }
    
    private func setupTabsView() {
        tabsContentView.backgroundColor = viewModel.tabsViewColor()
    }
    
    private func setupTableView() {
        SquadTableViewCell.register(tableView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = viewModel.tableViewBackgroundColor()
    }
    
    @objc private func backButtonPressed() {
        coordinator?.didPressBackButton()
    }
    
    @objc private func tabButtonPressed(sender: AnyObject) {
        guard let tabButton = sender as? UIButton else { return }
        tabsContentView.highlightTabElement(index: tabButton.tag)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.cellIdentifier, for: indexPath) as? SquadTableViewCell else { return UITableViewCell() }
        let cellViewModel = viewModel.squadCellViewModel(for: indexPath)
        cell.setup(viewModel: cellViewModel)
        cell.contentView.backgroundColor = viewModel.squadCellBackgroundColor()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let squadHeaderView = SquadTableViewHeader()
        squadHeaderView.setHeader(name: viewModel.titleForHeader(in: section), backgroundColor: viewModel.squadHeaderBackgroundColor())
        
        return squadHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UEFAConsts.SquadDetails.squadTableViewHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.isLastCell(from: indexPath) ? UEFAConsts.SquadDetails.squadTableViewCellExtendedHeight : UEFAConsts.SquadDetails.squadTableViewCellDefaultHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        viewModel.isLastSection(section) ? UEFAConsts.SquadDetails.squadTableViewFooterExtendedHeight : UEFAConsts.SquadDetails.squadTableViewFooterDefaultHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: view.bounds)
        footerView.backgroundColor = viewModel.squadFooterBackgroundColor()
        
        return footerView
    }
}
