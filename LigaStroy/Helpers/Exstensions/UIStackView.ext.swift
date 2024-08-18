//
//  UIStackView.ext.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView ...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
}
