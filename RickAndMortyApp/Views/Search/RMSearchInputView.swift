//
//  RMSearchInputView.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 04.02.2024.
//

import UIKit

protocol RMSearchInputViewDelegate: AnyObject {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOption)
    func rmSearchInputView(_ inputView: RMSearchInputView, didChangeSearchText text: String)
    func rmSearchInputViewDidTapSearchKeyboardButton(_ inputView: RMSearchInputView)
}

final class RMSearchInputView: UIView {
    
    weak var delegate: RMSearchInputViewDelegate?
    
    private var viewModel: RMSearchInputViewViewModel? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOptions else {
                return
            }
            let options = viewModel.options
            createOptionSelectionViews(options: options)
        }
    }
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    private var stackView: UIStackView?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(searchBar)
        setupConstraints()
        searchBar.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.searchPlaceHolderText
        self.viewModel = viewModel
    }
    
    private func createOptionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .center
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        return stackView
    }
    
    private func createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOption]) {
        let stackView = createOptionStackView()
        self.stackView = stackView
        
        for x in 0..<options.count {
            let option = options[x]
            let button = createButton(option: option, tag: x)
            
            stackView.addArrangedSubview(button)
        }
    }
    
    private func createButton(option: RMSearchInputViewViewModel.DynamicOption, tag: Int) -> UIButton {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(
                string: option.rawValue,
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.label
                ]
            ),
            for: .normal
        )
        
        button.backgroundColor = .secondarySystemFill
        
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.tag = tag
        button.layer.cornerRadius = 6
        return button
    }
    
    // MARK: - Public
    
    @objc private func didTapButton(_ sender: UIButton) {
        guard let options = viewModel?.options else {
            return
        }
        let tag = sender.tag
        let selected = options[tag]
        delegate?.rmSearchInputView(self, didSelectOption: selected)
    }
    
    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }
    
    public func update(with option: RMSearchInputViewViewModel.DynamicOption, value: String) {
        guard let buttons = stackView?.arrangedSubviews as? [UIButton],
              let allOptions = viewModel?.options,
              let index = allOptions.firstIndex(of: option) else {
            return
        }
        
        let button = buttons[index]
        button.setAttributedTitle(
            NSAttributedString(
                string: value.uppercased(),
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.link
                ]
            ),
            for: .normal
        )
    }
}

// MARK: - UISearchBarDelegate

extension RMSearchInputView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.rmSearchInputView(self, didChangeSearchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        delegate?.rmSearchInputViewDidTapSearchKeyboardButton(self)
    }
}
