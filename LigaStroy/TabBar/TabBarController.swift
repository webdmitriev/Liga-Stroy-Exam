//
//  TabBarController.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 16.08.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .appBlack
        self.tabBar.backgroundColor = .appWhite

        setupTabs()
    }
    
    private func setupTabs() {
        let mainVC = self.createNav(with: "Home", and: UIImage(named: "home"), vc: MainViewController())
        let searchVC = self.createNav(with: "Search", and: UIImage(named: "search"), vc: SearchViewController())
        let favoriteVC = self.createNav(with: "Favorite", and: UIImage(named: "favorite"), vc: FavoriteViewController())
        let servicesVC = self.createNav(with: "Services", and: UIImage(named: "services"), vc: ServicesViewController())
        
        self.setViewControllers([mainVC, searchVC, favoriteVC, servicesVC], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        return nav
    }

    
}
