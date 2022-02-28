//
//  HomeViewModel.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation
import UIKit

protocol HomeViewModelProtocol {
    func teamName() -> String
    func backgroundImage() -> UIImage?
    func tabsViewColor() -> UIColor
    func tabsHighlightColor() -> UIColor
}

public class HomeViewModel: HomeViewModelProtocol {
    
    private let team: Team
    private let type: Championship
    
    // MARK: Init
    
    init(team: Team, type: Championship) {
        self.team = team
        self.type = type
    }
    
    // MARK: Public
    
    public func teamName() -> String {
        team.name
    }
    
    public func backgroundImage() -> UIImage? {
        type == .ucl ? UIImage.uclBackgroundImage() : UIImage.uelBackgroundImage()
    }
    
    public func tabsViewColor() -> UIColor {
        type == .ucl ? UIColor(red: 15 / 255, green: 15 / 255, blue: 73 / 255, alpha: 1) : UIColor(red: 44 / 255, green: 44 / 255, blue: 46 / 255, alpha: 1)
    }
    
    public func tabsHighlightColor() -> UIColor {
        type == .ucl ? UIColor(red: 90 / 255, green: 247 / 255, blue: 220 / 255, alpha: 1) : UIColor(red: 255 / 255, green: 105 / 255, blue: 0 / 255, alpha: 1)
    }
}
