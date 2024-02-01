//
//  RMLocationTableViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 01.02.2024.
//

import Foundation

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
    
    private var location: RMLocation
    
    init(with location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        return location.name
    }
    
    public var type: String {
        return location.type
    }
    
    public var dimension: String {
        return location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        return lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(location.id)
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(dimension)
    }
}
