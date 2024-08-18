//
//  BuySellRentCollection.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

//import UIKit
//
//class BuySellRentCollection: UICollectionView {
//    
//    private let appBuilder = UIBuilder()
//    
//    private let buySellRentData = BuySellRentData.mockData()
//    
//    private lazy var buySellRentLayout: UICollectionViewFlowLayout = {
//        $0.scrollDirection = .horizontal
//        $0.itemSize = CGSize(width: 191, height: 125)
//        $0.minimumLineSpacing = 8
//        return $0
//    }(UICollectionViewFlowLayout())
//
//    private lazy var buySellRentCollection: UICollectionView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.heightAnchor.constraint(equalToConstant: 125).isActive = true
//        $0.dataSource = self
//        $0.register(BuySellRentCell.self, forCellWithReuseIdentifier: BuySellRentCell.reuseID)
//        $0.alwaysBounceHorizontal = true
//        $0.showsHorizontalScrollIndicator = false
//        $0.backgroundColor = .appBlue
//        return $0
//    }(UICollectionView(frame: .zero, collectionViewLayout: buySellRentLayout))
//    
////    override func viewDidLoad() {
////        super.viewDidLoad()
////    }
//    
//}
//
//extension BuySellRentCollection: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        buySellRentData.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuySellRentCell.reuseID, for: indexPath) as! BuySellRentCell
//        
//        let item = buySellRentData[indexPath.item]
//        
//        cell.setCellUI(item: item)
//        
//        return cell
//    }
//}
