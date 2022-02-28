//
//  WelcomeViewController.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var uefaChampionsLeagueButton: UIButton!
    @IBOutlet weak var uefaEuropeLeagueButton: UIButton!
    weak var coordinator: RootCoordinator?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        uefaChampionsLeagueButton.setTitle(UEFAConsts.WelcomeScreen.uefaChampionsLeagueButton, for: .normal)
        uefaEuropeLeagueButton.setTitle(UEFAConsts.WelcomeScreen.uefaEuropeLeagueButton, for: .normal)
    }
    
    @IBAction func uclButtonPressed(_ sender: Any) {
        coordinator?.didPressButton(type: .ucl)
    }
    
    @IBAction func uelButtonPressed(_ sender: Any) {
        coordinator?.didPressButton(type: .uel)
    }
}
