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
    
    var teams : [Team] = []
    var standings : [Standing] = []
    var playoffGames : [Game] = []
    var regularGames : [Game] = []
    var schedule : [Game] = []
    
    init () {
        
    }
    
    func addTeam(team: Team) {
        teams.append(team)
    }
    
    func addRegularGame(game: Game) {
        regularGames.append(game)
    }
    
    func addPlayoffGame(game: Game) {
        playoffGames.append(game)
    }
    
}
