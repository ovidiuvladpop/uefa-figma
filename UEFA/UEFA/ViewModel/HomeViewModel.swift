//
//  HomeViewModel.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation
import UIKit

protocol HomeViewModelProtocol {
    func loadData()
    func teamName() -> String
    func backgroundImage() -> UIImage?
    func tabsViewColor() -> UIColor
    func tabsHighlightColor() -> UIColor
}

public class HomeViewModel: HomeViewModelProtocol {
    private let type: Championship
    private var team: Team?
    
    // MARK: Init
    
    init(type: Championship) {
        self.type = type
    }
    
    // MARK: Public
    
    func loadData() {
        DataService.getData { [weak self] team in
            guard let self = self else { return }
            self.team = team
        }
    }
    
    public func teamName() -> String {
        guard let team = team else { return "" }
        return team.name
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
