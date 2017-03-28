//
//  WebsiteData.swift
//  BGBB
//
//  Created by Calvin Rose on 3/21/17.
//  Copyright © 2017 Calvin Rose. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

let scheduleURL = "http://bgbl.com/2016-2017-schedule/"
let scoresURL = "http://bgbl.com/2016-2017-scores/"
let standingsURL = "http://bgbl.com/standings/"

class WebsiteData {
    
    init() {}
    
    // Reload all data
    func getData(dataStore : LeagueData) {
        loadStandingsData(dataStore: dataStore)
        loadScores(dataStore: dataStore)
        loadSchedule(dataStore: dataStore)
    }
    
    // Retrieve standings data
    private func loadStandingsData(dataStore : LeagueData) {
        Alamofire.request(standingsURL).responseString { response in
            if let source = response.result.value {
                print("got source...")
                if let doc = HTML(html: source, encoding: .utf8) {
                    let divisionTables = ["#tablepress-6 tbody tr", "#tablepress-7 tbody tr"]
                    dataStore.standings = []
                    for division in 1...2 {
                        let selector = divisionTables[division - 1]
                        let matches = doc.css(selector)
                        if (matches.count != 0) {
                            for standing in matches.dropFirst() {
                                var chunks : [String] = []
                                for subdoc in standing.css("td") {
                                    chunks.append(subdoc.text ?? "Text get failed")
                                }
                                let teamName = chunks[0]
                                let wins = Int(chunks[1])!
                                let losses = Int(chunks[2])!
                                
                                let team = Team.get(name: teamName)
                                team.division = division
                                let standing = Standing(team: team, wins: wins, losses: losses)
                                dataStore.standings.append(standing)
                            }
                        }
                    }
                    dataStore.triggerListerners()
                } else {
                    print("could not parse html")
                }
            }
        }
    }
    
    // Retrieve scores data
    private func loadScoresTable(tableName : String, onDone : @escaping ([Game]) -> Void) {
        Alamofire.request(scoresURL).responseString { response in
            var games : [Game] = []
            if let source = response.result.value {
                if let doc = HTML(html: source, encoding: .utf8) {
                    for gameNode in doc.css("#\(tableName) tbody tr") {
                        
                        // Get game score
                        let scoreMatches = gameNode.css(".column-2")
                        if scoreMatches.count == 0 { continue }
                        
                        var scoreStrings = scoreMatches[0].text!
                            .components(separatedBy: "-")
                        scoreStrings.append("0")
                        scoreStrings.append("0")
                        let team1Score = Int(scoreStrings[0]) ?? 0
                        let team2Score = Int(scoreStrings[1]) ?? 0

                        // Get teams
                        let team1Matches = gameNode.css(".column-1 strong")
                        let team2Matches = gameNode.css(".column-3 strong")
                        if team1Matches.count == 0 || team2Matches.count == 0 { continue }
                        let team1 = Team.get(name: team1Matches[0].text ?? "No Team Name")
                        let team2 = Team.get(name: team2Matches[0].text ?? "No Team Name")
                        
                        // Make game object
                        let game = Game(team1: team1,
                                        team1Score: team1Score,
                                        team2: team2,
                                        team2Score: team2Score,
                                        date: "",
                                        location: "",
                                        hasHappened : true)
                        
                        games.append(game)
                    }
                    onDone(games)
                }
            } else {
                
            }
        }
    }
    
    // Load scores
    private func loadScores(dataStore : LeagueData) {
        loadScoresTable(tableName: "tablepress-8") { games in
            dataStore.regularGames = games
            dataStore.triggerListerners()
        }
        loadScoresTable(tableName: "tablepress-9") { games in
            dataStore.playoffGames = games
            dataStore.triggerListerners()
        }
    }
    
    // Get schedule
    private func loadSchedule(dataStore : LeagueData) {
        Alamofire.request(scheduleURL).responseString { response in
            if let source = response.result.value {
                if let doc = HTML(html: source, encoding: .utf8) {
                    dataStore.schedule = []
                    for gameNode in doc.css("#tablepress-4 tbody tr") {
                        // Get teams
                        let team1Matches = gameNode.css(".column-1 strong")
                        let team2Matches = gameNode.css(".column-w strong")
                        if team1Matches.count == 0 || team2Matches.count == 0 { continue }
                        let team1 = Team.get(name: team1Matches[0].text!)
                        let team2 = Team.get(name: team2Matches[0].text!)
                        
                        // Get week
                        //let week = Int(gameNode.css(".column-3")[0]).text!
                        
                        // Get date and location
                        let dateStringMatches = gameNode.css(".column-4")
                        let locationMatches = gameNode.css(".column-4 em")
                        if dateStringMatches.count == 0 || locationMatches.count == 0 { continue }
                        let dateString = dateStringMatches[0].content!
                        //let dateFormatter = DateFormatter()
                        //dateFormatter.dateFormat = "MMMM d, h:mm a"
                        //let date = dateFormatter.date(from: dateString) ?? Date()
                        let location = locationMatches[0].text!
                        
                        // Make game object
                        let game = Game(team1: team1,
                                        team1Score: 0,
                                        team2: team2,
                                        team2Score: 0,
                                        date: dateString,
                                        location: location,
                                        hasHappened : false)
                        
                        print(game.getSearchString())
                        dataStore.schedule.append(game)
                    }
                    dataStore.triggerListerners()
                }
            } else {
                
            }
        }
    }
}
