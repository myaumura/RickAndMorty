//
//  RMSettingsView.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 05.01.2024.
//

import SwiftUI

struct RMSettingsView: View {
    
    private let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(10)
                }
                Text(viewModel.title)
                Spacer()
            }
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

#Preview {
    RMSettingsView(
        viewModel: .init(
            cellViewModels: RMSettingsOption.allCases.compactMap({
                return RMSettingsCellViewModel(type: $0) { option in
                    
                }
            })
        )
    )
}
