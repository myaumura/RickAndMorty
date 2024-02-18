//
//  RMSearchInputViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.02.2024.
//

import Foundation

final class RMSearchInputViewViewModel {
    let type: RMSearchViewController.Config.`Type`
    
    // MARK: - Init
    
    init(type: RMSearchViewController.Config.`Type`) {
        self.type = type
    }
    
    enum DynamicOption: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var queryArgument: String {
            switch self {
            case .status:
                return "status"
            case .gender:
                return "gender"
            case .locationType:
                return "type"
            }
        }
        
        var choices: [String] {
            switch self {
            case .status:
                return ["alive", "dead", "unknown"]
            case .gender:
                return ["male", "female", "genderless", "unknown"]
            case .locationType:
                return ["planet", "microverse", "cluster"]
            }
        }
    }
    
    // MARK: - Public
    
    public var hasDynamicOptions: Bool {
        switch self.type {
        case .character, .location:
            return true
        case .episode:
            return false
        }
    }
    
    public var options: [DynamicOption] {
        switch self.type {
        case .character:
            return [.status, .gender]
        case .episode:
            return []
        case .location:
            return [.locationType]
        }
    }
    
    public var searchPlaceHolderText: String {
        switch self.type {
        case .character:
            return "Character Name"
        case .episode:
            return "Episode Name"
        case .location:
            return "Location Name"
        }
    }
}
