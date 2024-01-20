//
//  RMLocationViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 20.01.2024.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(RMRequest.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(model))
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
