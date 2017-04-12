//
//  Team.swift
//  BGBB
//
//  Created by Calvin Rose on 3/25/17.
//  Copyright © 2017 Calvin Rose. All rights reserved.
//

import Foundation

class Team : StringSearchable {

    // Keeps a cache of initialized teams
    fileprivate static var cache : [String : Team] = [:]
    
    let name : String
    var division : Int
    var imageURL = ""
    fileprivate static func normalizeName(_ name : String) -> String {
        let components = name.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    init(name : String, division : Int) {
        self.name = Team.normalizeName(name)
        self.division = division
        Team.cache[self.name] = self
    }
    
    static func get(_ name : String) -> Team {
        let realName = Team.normalizeName(name)
        if let team = cache[realName] {
            return team
        } else {
            //print("Getting uninitialized team, assuming division. MIGHT BE WRONG!")
            let team = Team(name: realName, division: 1)
            cache[realName] = team
            return team
        }
    }
    
    func getSearchString() -> String {
        return "\(self.name) \(division)"
    }
    
}
