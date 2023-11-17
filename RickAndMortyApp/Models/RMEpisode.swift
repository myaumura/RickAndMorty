//
//  RMEpisode.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 16.11.2023.
//

import Foundation

struct RMEpisode: Codable {
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
