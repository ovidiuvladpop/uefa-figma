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
    @IBOutlet weak var contentView: UIView!
    
    weak var coordinator: MainCoordinator?
    private var viewModel: HomeViewModelProtocol
    private var viewControllers: [UIViewController]

    // MARK: Lifecycle
    
    init(viewModel: HomeViewModel,
         viewControllers: [UIViewController]) {
        self.viewModel = viewModel
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
        addTargets()
        setupHeaderView()
        setupTabsView()
        addControllersViews()
        highlightFirstTab()
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
        tabsContentView.actionButtons.forEach { button in
            button.setTitleColor(viewModel.tabsHighlightColor(), for: .selected)
            button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.8), for: .normal)
        }
    }
    
    private func highlightFirstTab() {
        if let firstViewController = viewControllers.first,
           let firstViewControllerIndex = viewControllers.firstIndex(of: firstViewController) {
            contentView.bringSubviewToFront(firstViewController.view)
            tabsContentView.highlightTabElement(index: firstViewControllerIndex)
            tabsContentView.highlightUnderlineView(index: firstViewControllerIndex, color: viewModel.tabsHighlightColor())
        }
    }
    
    private func addControllersViews() {
        viewControllers.forEach { viewController in
            contentView.addSubview(viewController.view)
            viewController.view.frame = contentView.bounds
        }
    }
    
    @objc private func backButtonPressed() {
        coordinator?.didPressBackButton()
    }
    
    @objc private func tabButtonPressed(sender: AnyObject) {
        guard let tabButton = sender as? UIButton else { return }
        let viewController = viewControllers[tabButton.tag]
        contentView.bringSubviewToFront(viewController.view)
        tabsContentView.highlightTabElement(index: tabButton.tag)
        tabsContentView.highlightUnderlineView(index: tabButton.tag, color: viewModel.tabsHighlightColor())
    }
}
