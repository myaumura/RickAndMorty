//
//  RMCharacterController.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 16.11.2023.
//

import UIKit

final class RMCharacterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endPoint: .character, queryParameters: [URLQueryItem(name: "name", value: "rick"),
                                                                        URLQueryItem(name: "status", value: "alive")
                                                                       ])
        
        RMService.shared.execute(request,
                                 expecting: RMCharacter.self) { result in
            
        }
    }
}
