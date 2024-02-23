//
//  RMSearchResultViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 21.02.2024.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
