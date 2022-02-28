//
//  SquadViewModel.swift
//  UEFA
//
//  Created by Ovidiu Pop on 28.02.2022.
//

import Foundation
import UIKit

protocol SquadViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func titleForHeader(in section: Int) -> String
    func squadCellViewModel(for indexPath: IndexPath) -> SquadCellViewModel
    func isLastCell(from indexPath: IndexPath) -> Bool
    func isLastSection(_ section: Int) -> Bool
    func squadCellBackgroundColor() -> UIColor
    func squadHeaderBackgroundColor() -> UIColor
    func squadFooterBackgroundColor() -> UIColor
    func tableViewBackgroundColor() -> UIColor
}

public class SquadViewModel: SquadViewModelProtocol {
    
    private let team: Team
    private let type: Championship
    
    // MARK: Init
    
    init(team: Team, type: Championship) {
        self.team = team
        self.type = type
    }
    
    // MARK: Public
    
    public func numberOfSections() -> Int {
        team.squad.count
    }
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        team.squad[section].players.count
    }
    
    public func titleForHeader(in section: Int) -> String {
        team.squad[section].name
    }
    
    public func squadCellViewModel(for indexPath: IndexPath) -> SquadCellViewModel {
        let player = team.squad[indexPath.section].players[indexPath.row]
        return SquadCellViewModel(playerName: player.name, country: player.country, status: player.status)
    }
    
    public func isLastCell(from indexPath: IndexPath) -> Bool {
        (team.squad[indexPath.section].players.count - 1) == indexPath.row
    }
    
    public func isLastSection(_ section: Int) -> Bool {
        (team.squad.count - 1) == section
    }
    
    public func squadCellBackgroundColor() -> UIColor {
        type == .ucl ? UIColor(red: 10 / 255, green: 10 / 255, blue: 97 / 255, alpha: 1) : UIColor(red: 28 / 255, green: 28 / 255, blue: 30 / 255, alpha: 1)
    }
    
    public func squadHeaderBackgroundColor() -> UIColor {
        type == .ucl ? UIColor(red: 10 / 255, green: 10 / 255, blue: 97 / 255, alpha: 1) : UIColor(red: 28 / 255, green: 28 / 255, blue: 30 / 255, alpha: 1)
    }
    
    public func squadFooterBackgroundColor() -> UIColor {
        type == .ucl ? UIColor(red: 0 / 255, green: 0 / 255, blue: 64 / 255, alpha: 1) : .black
    }
    
    public func tableViewBackgroundColor() -> UIColor {
        type == .ucl ? UIColor(red: 0 / 255, green: 0 / 255, blue: 64 / 255, alpha: 1) : .black
    }
}
