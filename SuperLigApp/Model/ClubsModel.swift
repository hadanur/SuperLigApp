//
//  ClubsModel.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

struct Clubs: Codable {
    let clubs: [Club]
}

struct Club: Codable {
    let name: String
    let country: String
}
