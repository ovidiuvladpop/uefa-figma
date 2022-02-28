//
//  DataService.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation

public protocol DataServiceProtocol {
    static func getData(completion: (Team) -> Void)
}

public struct DataService: DataServiceProtocol {
    
    public static func getData(completion: (Team) -> Void) {
        //goalkeepers
        let firstGoalKeeper = Player(name: "Marc-Andre ter Stegen", country: "Germany", status: "24")
        let secondGoalKeeper = Player(name: "Neto", country: "Brazil", status: "24")
        let goalKeepers = SquadRole(name: "Goalkeepers", players: [firstGoalKeeper, secondGoalKeeper])
        
        //defender
        let firstDefender = Player(name: "Sergiño Dest", country: "Netherlands", status: "24")
        let secondDefender = Player(name: "Gerard Piqué", country: "Spain", status: "24")
        let thirdDefender = Player(name: "Ronald Araújo", country: "Uruguay", status: "24")
        let fourthDefender = Player(name: "Dani Alves", country: "Brazil", status: "24")
        let fifthDefender = Player(name: "Clément Lenglet", country: "France", status: "24")
        let sixthDefender = Player(name: "Jordi Alba", country: "Spain", status: "24")
        let seventhDefender = Player(name: "Óscar Mingueza", country: "Spain", status: "24")
        let eighthDefender = Player(name: "Samuel Umtiti", country: "Cameroon", status: "24")
        let ninethDefender = Player(name: "Eric García", country: "Spain", status: "24")
        let defenders = SquadRole(name: "Defenders", players: [firstDefender, secondDefender, thirdDefender, fourthDefender, fifthDefender, sixthDefender, seventhDefender, eighthDefender, ninethDefender])
        
        //mildfielders
        let firstMildfielder = Player(name: "Sergio Busquets", country: "Spain", status: "24")
        let secondMildfielder = Player(name: "Riqui Puig", country: "Spain", status: "24")
        let thirdMildfielder = Player(name: "Nico González", country: "Spain", status: "24")
        let fourthMildfielder = Player(name: "Pedri", country: "Spain", status: "24")
        let fifthMildfielder = Player(name: "Sergi Roberto", country: "Spain", status: "24")
        let sixthMildfielder = Player(name: "Frenkie de Jong", country: "Netherlands", status: "24")
        let mildfielders = SquadRole(name: "Mildfielders", players: [firstMildfielder, secondMildfielder, thirdMildfielder, fourthMildfielder, fifthMildfielder, sixthMildfielder])
        
        //forwards
        let firstForward = Player(name: "Ousmane Dembélé", country: "France", status: "24")
        let secondForward = Player(name: "Memphis Depay", country: "Netherlands", status: "24")
        let thirdForward = Player(name: "Ansu Fati", country: "Guinea-Bissau", status: "24")
        let fourthForward = Player(name: "Adama Traoré", country: "Spain", status: "24")
        let fifthForward = Player(name: "Martin Braithwaite", country: "Denmark", status: "24")
        let sixthForward = Player(name: "Luuk de Jong", country: "Switzerland", status: "24")
        let seventhForward = Player(name: "Ferran Torres", country: "Spain", status: "24")
        let eighthForward = Player(name: "Pierre-Emerick Aubameyang", country: "France", status: "24")
        let forwards = SquadRole(name: "Forwards", players: [firstForward, secondForward, thirdForward, fourthForward, fifthForward, sixthForward, seventhForward, eighthForward])
        
        //coach
        let coach = Player(name: "Xavi", country: "Spain", status: "24")
        let coaches = SquadRole(name: "Coach", players: [coach])
        
        completion(Team(name: "Barcelona", squad: [goalKeepers, defenders, mildfielders, forwards, coaches]))
    }
}
