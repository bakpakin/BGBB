//
//  Game.swift
//  BGBB
//
//  Created by Calvin Rose on 3/25/17.
//  Copyright © 2017 Calvin Rose. All rights reserved.
//

import Foundation

class Game : StringSearchable {
    
    let team1: Team
    let team2: Team
    let date: Date
    let location: String
    let team1Score: Int
    let team2Score: Int
    
    init(team1 : Team, team1Score : Int,
         team2 : Team, team2Score : Int,
         date : Date, location : String) {
        self.team1 = team1
        self.team1Score = team1Score
        self.team2Score = team2Score
        self.team2 = team2
        self.date = date
        self.location = location
    }
    
    func getSearchString() -> String {
        return "\(team1.getSearchString()) \(team2.getSearchString()) \(location) \(team1Score) \(team2Score)"
    }

}
