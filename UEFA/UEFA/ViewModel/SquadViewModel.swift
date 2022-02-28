//
//  SquadViewModel.swift
//  UEFA
//
//  Created by Ovidiu Pop on 28.02.2022.
//

import Foundation
import UIKit

protocol SquadViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func titleForHeader(in section: Int) -> String
    func squadCellViewModel(for indexPath: IndexPath) -> SquadCellViewModel?
    func isLastCell(from indexPath: IndexPath) -> Bool
    func isLastSection(_ section: Int) -> Bool
    func squadCellBackgroundColor() -> UIColor
    func squadHeaderBackgroundColor() -> UIColor
    func squadFooterBackgroundColor() -> UIColor
    func tableViewBackgroundColor() -> UIColor
}

public class SquadViewModel: SquadViewModelProtocol {
    
    private let type: Championship
    private var team: Team?
    
    // MARK: Init
    
    init(type: Championship) {
        self.type = type
    }
    
    // MARK: Public
    
    public func loadData() {
        DataService.getData { [weak self] team in
            guard let self = self else { return }
            self.team = team
        }
    }
    
    public func numberOfSections() -> Int {
        guard let team = team else { return 0 }
        return team.squad.count
    }
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        guard let team = team else { return 0 }
        return team.squad[section].players.count
    }
    
    public func titleForHeader(in section: Int) -> String {
        guard let team = team else { return "" }
        return team.squad[section].name
    }
    
    public func squadCellViewModel(for indexPath: IndexPath) -> SquadCellViewModel? {
        guard let team = team else { return nil }
        let player = team.squad[indexPath.section].players[indexPath.row]
        return SquadCellViewModel(playerName: player.name, country: player.country, status: player.status)
    }
    
    public func isLastCell(from indexPath: IndexPath) -> Bool {
        guard let team = team else { return false }
        return (team.squad[indexPath.section].players.count - 1) == indexPath.row
    }
    
    public func isLastSection(_ section: Int) -> Bool {
        guard let team = team else { return false }
        return (team.squad.count - 1) == section
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
