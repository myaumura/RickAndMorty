//
//  RMSettingsCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.01.2024.
//

import UIKit

struct RMSettingsCellViewModel {
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    private let type: RMSettingsOption
    
    init(type: RMSettingsOption) {
        self.type = type
    }
}
