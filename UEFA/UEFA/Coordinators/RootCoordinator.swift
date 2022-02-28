//
//  RootCoordinator.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation
import UIKit

class RootCoordinator: BaseCoordinatorProtocol {
    var childCoordinators = [BaseCoordinatorProtocol]()
    var navigationController: UINavigationController
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public
    
    public func start() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.coordinator = self
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
    
    public func didPressButton(type: Championship) {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, type: type)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.parentCoordinator = self
        mainCoordinator.start()
    }
    
    public func childDidFinish(_ child: BaseCoordinatorProtocol) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
