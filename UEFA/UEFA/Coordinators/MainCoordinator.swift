//
//  MainCoordinator.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import Foundation
import UIKit

class MainCoordinator: BaseCoordinatorProtocol {
    var childCoordinators = [BaseCoordinatorProtocol]()
    var navigationController: UINavigationController
    var championship: Championship
    weak var parentCoordinator: RootCoordinator?
    
    // MARK: Init
    
    init(navigationController: UINavigationController,
         type: Championship) {
        self.navigationController = navigationController
        self.championship = type
    }
    
    // MARK: Public
    
    func start() {
        let squadViewModel = SquadViewModel(type: championship)
        let homeViewModel = HomeViewModel(type: championship)
        let homeViewController = HomeViewController(viewModel: homeViewModel,
                                                    viewControllers: [OverviewViewController(), MatchesViewController(), GroupsViewController(), StatsViewController(), SquadTableViewController(viewModel: squadViewModel)])
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    public func didPressBackButton() {
        navigationController.popViewController(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}
