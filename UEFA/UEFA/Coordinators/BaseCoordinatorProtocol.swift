//
//  BaseCoordinatorProtocol.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import Foundation
import UIKit

protocol BaseCoordinatorProtocol: class {
    var navigationController: UINavigationController { get set }
    
    func start()
}
