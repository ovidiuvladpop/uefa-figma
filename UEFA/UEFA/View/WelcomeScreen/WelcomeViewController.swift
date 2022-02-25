//
//  WelcomeViewController.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func didPressButton()
}

class WelcomeViewController: UIViewController {
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func uclButtonPressed(_ sender: Any) {
        delegate?.didPressButton()
    }
    
    @IBAction func uelButtonPressed(_ sender: Any) {
        delegate?.didPressButton()
    }
}
