//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    
    public let title: String
    public let value: String
    
    init(title: String, value: String) {
        self.value = value
        self.title = title
    }
}
