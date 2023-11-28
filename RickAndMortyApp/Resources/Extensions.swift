//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Kirill Gusev on 28.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
