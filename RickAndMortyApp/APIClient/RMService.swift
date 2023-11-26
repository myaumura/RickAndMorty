//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 17.11.2023.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
