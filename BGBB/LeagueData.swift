//
//  LeagueData.swift
//  BGBB
//
//  Contains all data releveant to the league
//
//  Created by Calvin Rose on 3/25/17.
//  Copyright © 2017 Calvin Rose. All rights reserved.
//

import Foundation

class LeagueData {
    
    static let single : LeagueData = LeagueData()
    
    var teams : [Team] = []
    var standings : [Standing] = []
    var playoffGames : [Game] = []
    var regularGames : [Game] = []
    var schedule : [Game] = []
    
     init () {
        
    }
    
    func addTeam(_ team: Team) {
        teams.append(team)
    }
    
    func addRegularGame(_ game: Game) {
        regularGames.append(game)
    }
    
    func addPlayoffGame(_ game: Game) {
        playoffGames.append(game)
    }
    
}
