//
//  RMSettingsViewController.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 16.11.2023.
//

import SwiftUI

final class RMSettingsViewController: UIViewController {

    private let viewModel = RMSettingsViewViewModel(cellViewModels: RMSettingsOption.allCases.compactMap({
        return RMSettingsCellViewModel(type: $0)
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }
}
