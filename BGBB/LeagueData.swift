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
    
    var listeners : [(Void) -> Void] = []
    
    private init () {
        
    }
    
    func addListener(listener: @escaping (Void) -> Void) {
        listeners.append(listener)
    }
    
    func triggerListerners() {
        for l in listeners {
            l()
        }
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
