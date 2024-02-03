//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 18.12.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    private let type: `Type`
    private var value: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue: String {
        if value.isEmpty { return "None" }
        
        if let  date = Self.dateFormatter.date(from: value),
                type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemBlue
            case .type:
                return .systemYellow
            case .species:
                return .systemBlue
            case .origin:
                return .systemBlue
            case .location:
                return .systemGreen
            case .created:
                return .systemBlue
            case .episodeCount:
                return .systemBlue
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "heart.fill")
            case .gender:
                return UIImage(systemName: "figure")
            case .type:
                return UIImage(systemName: "star.fill")
            case .species:
                return UIImage(systemName: "person.crop.circle")
            case .origin:
                return UIImage(systemName: "globe")
            case .location:
                return UIImage(systemName: "location.fill")
            case .created:
                return UIImage(systemName: "clock")
            case .episodeCount:
                return UIImage(systemName: "tv")
            }
        }
        
        var displayTitle: String {
            switch self {
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .location,
                    .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "Episode Count"
            }
        }
    }
    
    // MARK: - Init
    
    init(type: `Type`, value: String) {
        self.type = type
        self.value = value
    }
}
