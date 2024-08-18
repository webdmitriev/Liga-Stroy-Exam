//
//  UIBuilder.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 17.08.2024.
//

import UIKit

class UIBuilder {
    
    let offsetPage: CGFloat = 16
    
    func addScrollView(bgc: UIColor) -> UIScrollView {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.alwaysBounceVertical = true
        scroll.backgroundColor = bgc
        return scroll
    }
    
    func addView(bgc: UIColor, brs: CGFloat = 0, clipsToBounds: Bool = true) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = bgc
        view.layer.cornerRadius = brs
        view.clipsToBounds = clipsToBounds
        return view
    }
    
    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, lines: Int = 0, color: UIColor = .appBlack) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = text
        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.numberOfLines = lines
        txt.textColor = color
        
        return txt
    }
    
    func addTextField(placeholder: String, secure: Bool = false) -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false

        field.heightAnchor.constraint(equalToConstant: 60).isActive = true
        field.addPaddingToTextField(top: 20, right: 20, left: 20, bottom: 20)

        field.font = .systemFont(ofSize: 16, weight: .regular)
        field.textColor = .appBlack
        field.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor: UIColor.appBlack])

        field.backgroundColor = .appGray
        field.layer.cornerRadius = 30
        
        field.isSecureTextEntry = secure

        return field
    }
    
    func addButton(text: String, offsetH: CGFloat = 60, bgc: UIColor = .appBlue, brs: CGFloat = 30) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: offsetH).isActive = true
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = bgc
        btn.layer.cornerRadius = brs
        return btn
    }
    
    func addStack(alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat = 0) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        
        return stack
    }
    
    
}
