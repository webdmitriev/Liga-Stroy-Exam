//
//  BuySellRentCell.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

import UIKit

class BuySellRentCell: UICollectionViewCell {
    
    static let reuseID: String = "BuySellRentCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var cellTitle: UILabel = appBuilder.addLabel(text: "", fontS: 15, fontW: .bold)
    
    private lazy var cellBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 10).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 18).isActive = true
        $0.setImage(.arrowIcon, for: .normal)
        return $0
    }(UIButton())
    
    private lazy var cellDescr: UILabel = appBuilder.addLabel(text: "", fontS: 12, fontW: .medium, lines: 4, color: .appText)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        contentView.addSubviews(cellTitle, cellBtn, cellDescr)
        
        constraitionUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellUI(item: BuySellRentData) {
        self.cellTitle.text = item.title
        self.cellDescr.text = item.descr
    }
    
    
    private func constraitionUI() {
        //cellTitle.backgroundColor = .systemRed

        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            cellTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            cellTitle.trailingAnchor.constraint(equalTo: cellBtn.leadingAnchor, constant: -18),
            
            cellBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            cellBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellDescr.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 7),
            cellDescr.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            cellDescr.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
}
