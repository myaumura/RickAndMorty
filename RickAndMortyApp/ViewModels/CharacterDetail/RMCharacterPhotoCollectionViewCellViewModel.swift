//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    
    private let imageUrl : URL?
    
    init(with imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
}
