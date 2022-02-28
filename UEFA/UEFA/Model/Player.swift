//
//  Player.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation

public struct Player {
    let name: String
    let country: String
    let status: String
}

public struct SquadRole {
    let name: String
    let players: [Player]
}

public struct Team {
    let name: String
    let squad: [SquadRole]
}

public enum Championship {
    case ucl
    case uel
}

public enum HeaderState {
    case expanded
    case collapsed
}
