//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import UIKit

class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
         
    }
    
    public func configure(with viewModels: RMCharacterEpisodeCollectionViewCellViewModel) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
