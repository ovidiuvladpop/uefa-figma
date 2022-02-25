//
//  MainCoordinator.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import Foundation
import UIKit

class MainCoordinator: BaseCoordinatorProtocol {
    var navigationController: UINavigationController
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
}

extension MainCoordinator: WelcomeViewControllerDelegate {
    func didPressButton() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
