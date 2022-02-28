//
//  Consts.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation
import CoreGraphics

public enum UEFAConsts {
    public enum SquadDetails {
        public static let squadTableViewCellDefaultHeight: CGFloat = 60
        public static let squadTableViewCellExtendedHeight: CGFloat = 76
        public static let squadTableViewHeaderHeight: CGFloat = 50
        public static let squadTableViewFooterDefaultHeight: CGFloat = 8
        public static let squadTableViewFooterExtendedHeight: CGFloat = 92
        public static let squadTableViewFooterLabel = "* Player B"
    }
    
    public enum WelcomeScreen {
        public static let uefaChampionsLeagueButton = "UCL"
        public static let uefaEuropeLeagueButton = "UEL"
    }
    
    public enum HomeScreen {
        public static let playingLabel = "Playing"
        public static let roundDescriptionLabel = "Round of 16"
        public static let headerContentViewExpandedHeight: CGFloat = 286
        public static let headerContentViewCollapsedHeight: CGFloat = 75
        
        public enum HomeScreenTabs {
            public static let overview = "Overview"
            public static let matches = "Matches"
            public static let groups = "Groups"
            public static let stats = "Stats"
            public static let squad = "Squad"
        }
    }
}
