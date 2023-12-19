//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataURL: URL?
    
    init(episodeDataURL: URL?) {
        self.episodeDataURL = episodeDataURL
    }
}
