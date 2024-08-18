//
//  UITextField.ext.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 17.08.2024.
//

import UIKit

extension UITextField {
    func addPaddingToTextField(top: Double, right: Double, left: Double, bottom: Double) {
        let paddingView: UIView = UIView.init(frame: CGRectMake(top, right, left, bottom))
        self.leftView = paddingView;
        self.leftViewMode = .always;
        self.rightView = paddingView;
        self.rightViewMode = .always;
    }
}
