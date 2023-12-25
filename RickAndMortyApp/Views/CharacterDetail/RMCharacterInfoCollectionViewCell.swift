//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.backgroundColor = .systemBlue
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemRed
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemMint
        return stackView
    }()
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(titleContainerView, stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(valueLabel)
        titleContainerView.addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        valueLabel.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLabel.tintColor = .label
    }
    
    public func configure(with viewModels: RMCharacterInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModels.title
        titleLabel.textColor = viewModels.tintColor
        valueLabel.text = viewModels.displayValue
        iconImageView.image = viewModels.iconImage
        iconImageView.tintColor = viewModels.tintColor
    }
}

private extension RMCharacterInfoCollectionViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: titleContainerView.topAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            iconImageView.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -15),
            iconImageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
            
            valueLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            valueLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            valueLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
            
        ])
    }
}
