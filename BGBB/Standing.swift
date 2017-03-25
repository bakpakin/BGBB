//
//  Standing.swift
//  BGBB
//
//  Created by Calvin Rose on 3/25/17.
//  Copyright © 2017 Calvin Rose. All rights reserved.
//

import Foundation

class Standing : StringSearchable {
    
    let team : Team
    let wins : Int
    let losses : Int
    
    init(team : Team, wins : Int, losses : Int) {
        self.team = team
        self.wins = wins
        self.losses = losses
    }
    
    func getSearchString() -> String {
        return "\(team.getSearchString()) \(wins) \(losses)"
    }
    
}
