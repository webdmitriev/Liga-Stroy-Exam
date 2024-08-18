//
//  HousesBlockCell.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

import UIKit

class HousesBlockCell: UICollectionViewCell {
    
    static let reuseID: String = "HousesBlockCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var cellTitle: UILabel = appBuilder.addLabel(text: "title", fontS: 15, fontW: .bold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
