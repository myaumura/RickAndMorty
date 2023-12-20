//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    public let title: String
    public let value: String
    
    enum `Type` {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case episodeCount
    }
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
    }
}
