//
//  RMLocationViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 20.01.2024.
//

import Foundation

protocol RMLocationViewModelViewDelegate: AnyObject {
    func didFetchInitialLocation()
}

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(with: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    weak var delegate: RMLocationViewModelViewDelegate?
    
    public var shouldShowMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return locations[index]
    }
    
    private var didFinishPagination: (() -> Void)?
    
    init() {}
    
    public func registerDidFinishBaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block 
    }
    
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else { return }
        
        guard let nextUrlString = apiInfo?.next, let url = URL(string: nextUrlString) else { return }
        
        isLoadingMoreLocations = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            return
        }
        
        RMService.shared.execute(
            request,
            expecting: RMGetAllLocationsResponse.self) { [weak self] result in
                guard let strongSelf = self else { return }
                
                switch result {
                case .success(let responseModel):
                    let moreResults = responseModel.results
                    let info = responseModel.info
                    strongSelf.apiInfo = info
                    strongSelf.cellViewModels.append(contentsOf: moreResults.compactMap({
                        return RMLocationTableViewCellViewModel(with: $0)
                    }))
            
                    DispatchQueue.main.async {
                        strongSelf.isLoadingMoreLocations = false
                        strongSelf.didFinishPagination?()
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                    self?.isLoadingMoreLocations = false
                }
            }
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            RMRequest.listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocation()
                }
            case .failure:
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
