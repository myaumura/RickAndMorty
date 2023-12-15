//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.12.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    private var requestURL: URL? {
        return URL(string: character.url)
    }
    
    public var title:String { 
        character.name.uppercased()
    }
}
