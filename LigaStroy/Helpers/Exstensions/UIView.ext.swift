//
//  UIView.ext.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 17.08.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
}
