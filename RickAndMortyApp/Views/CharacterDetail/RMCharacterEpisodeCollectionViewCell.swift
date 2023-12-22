//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
         
    }
    
    public func configure(with viewModels: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModels.registerForData { data in
            print(data.name)
            print(data.air_date)
            print(data.episode)
        }
        viewModels.fetchEpisode()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
