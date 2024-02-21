//
//  RMSearchViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.02.2024.
//

import UIKit

final class RMSearchViewViewModel {
    
    let config: RMSearchViewController.Config
    
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    
    private var searchResultHandler: (() -> Void)?
    
    // MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func registerSearchResultHandler(_ block: @escaping () -> Void) {
        self.searchResultHandler = block
    }
    
    public func executeSearch() {
        
        print("Search text \(searchText)")
        
        var queryParameters: [URLQueryItem] = [URLQueryItem(name: "name", value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))]
        
        queryParameters.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        let request = RMRequest(endPoint: config.type.endpoint, queryParameters: queryParameters)
        
        switch config.type.endpoint {
        case .character:
            RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { result in
                switch result {
                case .success(let model):
                    print("Search result count \(model.results.count)")
                case .failure:
                    print("Failed to get results")
                }
            }
        case .episode:
            RMService.shared.execute(request, expecting: RMGetAllEpisodesResponse.self) { result in
                switch result {
                case .success(let model):
                    print("Search result count \(model.results.count)")
                case .failure:
                    print("Failed to get results")
                }
            }
        case .location:
            RMService.shared.execute(request, expecting: RMGetAllLocationsResponse.self) { result in
                switch result {
                case .success(let model):
                    print("Search result count \(model.results.count)")
                case .failure:
                    print("Failed to get results")
                }
            }
        }
    }
    
    private func makeSearchAPICall<T: Codable>(_ type: T.Type) {
        
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}
