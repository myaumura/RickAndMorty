//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 17.11.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}