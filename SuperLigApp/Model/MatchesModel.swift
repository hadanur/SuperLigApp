//
//  MatchesModel.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

struct MatchBase: Codable {
    let name: String
    let matches: [Match]
}

struct Match: Codable {
    let round: String
    let date: String
    let team1: String
    let team2: String
    let score: Score
}

struct Score: Codable {
    let ft: [Int]
}
