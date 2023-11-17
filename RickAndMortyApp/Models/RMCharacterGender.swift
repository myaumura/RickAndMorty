//
//  RMCharacterGender.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 17.11.2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
