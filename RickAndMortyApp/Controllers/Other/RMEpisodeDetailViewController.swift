//
//  RMEpisodeDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 24.12.2023.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?

    // MARK: - Init
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Episode"
    }
}
