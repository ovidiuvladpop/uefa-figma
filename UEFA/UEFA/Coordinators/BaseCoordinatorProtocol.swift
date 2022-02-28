//
//  BaseCoordinatorProtocol.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import Foundation
import UIKit

public protocol BaseCoordinatorProtocol: class {
    var childCoordinators: [BaseCoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
