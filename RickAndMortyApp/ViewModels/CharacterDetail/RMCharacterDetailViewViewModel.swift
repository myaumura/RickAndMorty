//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.12.2023.
//

import UIKit

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information(viewModels: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes(viewModels: [RMCharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    // MARK: - Init
    
    init(character: RMCharacter) {
        self.character = character
        setupSections()
    }
    
    private func setupSections() {
        sections = [
            .photo(viewModel: .init(with: URL(string: character.image))),
            .information(
                viewModels: [
                    .init(title: character.status.text, value: "Status"),
                    .init(title: character.gender.rawValue, value: "Gender"),
                    .init(title: character.type, value: "Type"),
                    .init(title: character.species, value: "Species"),
                    .init(title: character.origin.name, value: "Origin"),
                    .init(title: character.location.name, value: "Location"),
                    .init(title: character.created, value: "Created"),
                    .init(title: "\(character.episode.count)", value: "Total Episodes"),
                ]
            ),
            .episodes(
                viewModels: character.episode.compactMap ({
                    return RMCharacterEpisodeCollectionViewCellViewModel(episodeDataURL: URL(string: $0))
                }))
        ]
    }
    
    private var requestURL: URL? {
        return URL(string: character.url)
    }
    
    public var title:String {
        character.name.uppercased()
    }
    
    // MARK: - Layouts
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 10,
            trailing: 0
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createInfoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)
            ),
            subitems: [item, item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createEpisodeSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 10,
            trailing: 8
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)
            ),
            subitems: [item, item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}