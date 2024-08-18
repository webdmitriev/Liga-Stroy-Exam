//
//  MainViewController.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 17.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let appBuilder = UIBuilder()
    
    private let buySellRentData = BuySellRentData.mockData()
    
    private let housesData = HousesData.mockData()
    
    // MARK: - ScrollView
    private lazy var scrollView: UIScrollView = appBuilder.addScrollView(bgc: .appBlue)
    private lazy var scrollContent: UIView = appBuilder.addView(bgc: .clear, clipsToBounds: false)
    
    // MARK: - Content
    private lazy var logotype: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 34).isActive = true
        $0.image = .logotype
        return $0
    }(UIImageView())
    private lazy var titlePage: UILabel = appBuilder.addLabel(text: "Сервис квартирных решений от сделки до отделки",
                                                              fontS: 23, fontW: .bold, lines: 2, color: .appWhite)
    
    // MARK: - buySellRentLayout
    private lazy var buySellRentCollection = BuySellRent()
    
    // MARK: - block content
    private lazy var blockContent: UIView = appBuilder.addView(bgc: .white, brs: 15)
    private lazy var blockContentTitle: UILabel = appBuilder.addLabel(text: "Услуги", fontS: 24, fontW: .bold)

    // MARK: - block one
    private lazy var blockContentOne: UIView = appBuilder.addView(bgc: .appPurpur, brs: 10)
    private lazy var blockContentOneTitle: UILabel = appBuilder.addLabel(text: "Страхование",
                                                                         fontS: 14, fontW: .bold, lines: 2, color: .appBlack)
    private lazy var blockContentOneDescr: UILabel = appBuilder.addLabel(text: "Защитите имущество\nздоровье и жизнь",
                                                                         fontS: 13, fontW: .regular, lines: 2, color: .appText)

    // MARK: - block two
    private lazy var blockContentTwo: UIView = appBuilder.addView(bgc: .appGreen, brs: 10)
    private lazy var blockContentTwoTitle: UILabel = appBuilder.addLabel(text: "Оценка недвижимости",
                                                                         fontS: 14, fontW: .bold, lines: 2, color: .appBlack)
    private lazy var blockContentTwoDescr: UILabel = appBuilder.addLabel(text: "Узнайте стоимость \nобъекта недвижимости",
                                                                         fontS: 13, fontW: .regular, lines: 2, color: .appText)

    // MARK: - block three
    private lazy var blockContentThree: UIView = appBuilder.addView(bgc: .appRed, brs: 10)
    private lazy var blockContentThreeTitle: UILabel = appBuilder.addLabel(text: "Дизайн \nинтерьера",
                                                                         fontS: 14, fontW: .bold, lines: 2, color: .appBlack)
    
    // MARK: - houses Block
    private lazy var housesBlockTitle: UILabel = appBuilder.addLabel(text: "Жилые комплексы", fontS: 24, fontW: .bold)
//    private lazy var housesBlockLayout: UICollectionViewFlowLayout = {
//        $0.scrollDirection = .horizontal
//        $0.itemSize = CGSize(width: 258, height: 193)
//        $0.minimumLineSpacing = 8
//        return $0
//    }(UICollectionViewFlowLayout())
//    private lazy var housesBlockCollection: UICollectionView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.heightAnchor.constraint(equalToConstant: 193).isActive = true
//        $0.dataSource = self
//        $0.register(HousesBlockCell.self, forCellWithReuseIdentifier: HousesBlockCell.reuseID)
//        $0.alwaysBounceHorizontal = true
//        $0.showsHorizontalScrollIndicator = false
//        $0.backgroundColor = .appBlue
//        return $0
//    }(UICollectionView(frame: .zero, collectionViewLayout: housesBlockLayout))
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlue

        view.addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        
        setupUI()
        constraintsUI()
    }
    
    private func setupUI() {
        scrollContent.addSubviews(logotype, titlePage, buySellRentCollection, blockContent)
        
        // MARK: - buySellRentLayout
        buySellRentCollection.translatesAutoresizingMaskIntoConstraints = false
        buySellRentCollection.setupUI()
        
        // MARK: - block content
        blockContent.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blockContent.addSubviews(blockContentTitle, blockContentOne, blockContentTwo, blockContentThree, housesBlockTitle)
        
        blockContentOne.addSubviews(blockContentOneTitle, blockContentOneDescr)
        blockContentTwo.addSubviews(blockContentTwoTitle, blockContentTwoDescr)
        blockContentThree.addSubviews(blockContentThreeTitle)

        
    }
    
    private func constraintsUI() {
//        housesBlockCollection.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: appBuilder.offsetPage),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -appBuilder.offsetPage),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -appBuilder.offsetPage * 2),
            
            // MARK: - Content
            logotype.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 0),
            logotype.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
            
            titlePage.topAnchor.constraint(equalTo: logotype.bottomAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
            titlePage.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: 0),
            
            // MARK: - buySellRentLayout
            buySellRentCollection.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 20),
            buySellRentCollection.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
            buySellRentCollection.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: 0),
            
            // MARK: - block content
            blockContent.topAnchor.constraint(equalTo: buySellRentCollection.bottomAnchor, constant: 25),
            blockContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            blockContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            //blockContent.heightAnchor.constraint(equalToConstant: 320),
            
            blockContentTitle.topAnchor.constraint(equalTo: blockContent.topAnchor, constant: 30),
            blockContentTitle.leadingAnchor.constraint(equalTo: blockContent.leadingAnchor, constant: appBuilder.offsetPage),
            blockContentTitle.trailingAnchor.constraint(equalTo: blockContent.trailingAnchor, constant: -appBuilder.offsetPage),
            
            // MARK: - block one
            blockContentOne.topAnchor.constraint(equalTo: blockContentTitle.bottomAnchor, constant: 15),
            blockContentOne.leadingAnchor.constraint(equalTo: blockContent.leadingAnchor, constant: appBuilder.offsetPage),
            blockContentOne.trailingAnchor.constraint(equalTo: blockContent.trailingAnchor, constant: -appBuilder.offsetPage),
            blockContentOne.heightAnchor.constraint(equalToConstant: 106),
            
            blockContentOneTitle.topAnchor.constraint(equalTo: blockContentOne.topAnchor, constant: 18),
            blockContentOneTitle.leadingAnchor.constraint(equalTo: blockContentOne.leadingAnchor, constant: 12),
            blockContentOneTitle.trailingAnchor.constraint(equalTo: blockContentOne.trailingAnchor, constant: -12),

            blockContentOneDescr.topAnchor.constraint(equalTo: blockContentOneTitle.bottomAnchor, constant: 6),
            blockContentOneDescr.leadingAnchor.constraint(equalTo: blockContentOne.leadingAnchor, constant: 12),
            blockContentOneDescr.trailingAnchor.constraint(equalTo: blockContentOne.trailingAnchor, constant: -12),
            
            // MARK: - block two
            blockContentTwo.topAnchor.constraint(equalTo: blockContentOne.bottomAnchor, constant: 6),
            blockContentTwo.leadingAnchor.constraint(equalTo: blockContent.leadingAnchor, constant: appBuilder.offsetPage),
            blockContentTwo.widthAnchor.constraint(equalTo: blockContent.widthAnchor, multiplier: 0.5, constant: -20),
            blockContentTwo.heightAnchor.constraint(equalToConstant: 106),
            
            blockContentTwoTitle.topAnchor.constraint(equalTo: blockContentTwo.topAnchor, constant: 18),
            blockContentTwoTitle.leadingAnchor.constraint(equalTo: blockContentTwo.leadingAnchor, constant: 12),
            blockContentTwoTitle.trailingAnchor.constraint(equalTo: blockContentTwo.trailingAnchor, constant: -12),

            blockContentTwoDescr.topAnchor.constraint(equalTo: blockContentTwoTitle.bottomAnchor, constant: 6),
            blockContentTwoDescr.leadingAnchor.constraint(equalTo: blockContentTwo.leadingAnchor, constant: 12),
            blockContentTwoDescr.trailingAnchor.constraint(equalTo: blockContentTwo.trailingAnchor, constant: -12),
            
            // MARK: - block three
            blockContentThree.topAnchor.constraint(equalTo: blockContentOne.bottomAnchor, constant: 6),
            blockContentThree.trailingAnchor.constraint(equalTo: blockContent.trailingAnchor, constant: -appBuilder.offsetPage),
            blockContentThree.widthAnchor.constraint(equalTo: blockContent.widthAnchor, multiplier: 0.5, constant: -20),
            blockContentThree.heightAnchor.constraint(equalToConstant: 106),
            
            blockContentThreeTitle.topAnchor.constraint(equalTo: blockContentThree.topAnchor, constant: 18),
            blockContentThreeTitle.leadingAnchor.constraint(equalTo: blockContentThree.leadingAnchor, constant: 12),
            blockContentThreeTitle.trailingAnchor.constraint(equalTo: blockContentThree.trailingAnchor, constant: -12),

            housesBlockTitle.topAnchor.constraint(equalTo: blockContentThree.bottomAnchor, constant: 25),
            housesBlockTitle.leadingAnchor.constraint(equalTo: blockContent.leadingAnchor, constant: appBuilder.offsetPage),
            housesBlockTitle.trailingAnchor.constraint(equalTo: blockContent.trailingAnchor, constant: -appBuilder.offsetPage),
            
            // MARK: - houses Block
//            housesBlockCollection.topAnchor.constraint(equalTo: housesBlockTitle.bottomAnchor, constant: 15),
//            housesBlockCollection.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
//            housesBlockCollection.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: 0),
            
            
            housesBlockTitle.bottomAnchor.constraint(equalTo: blockContent.bottomAnchor, constant: -20),
            blockContent.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: 0),
        ])
    }
    
    
    
    
    // MARK: - Hide Nav Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
