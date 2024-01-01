//
//  RMEpisodeInfoCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 01.01.2024.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMEpisodeInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupLayer() {
        layer.cornerRadius = 9
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellViewModel) {
        
    }
}
