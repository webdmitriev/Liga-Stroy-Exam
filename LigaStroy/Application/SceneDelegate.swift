//
//  SceneDelegate.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 16.08.2024.
//

import UIKit

protocol SceneDelegateProtocol {
    func changeRootVC()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, SceneDelegateProtocol, UITabBarControllerDelegate {

    var window: UIWindow?
    
    func changeRootVC() {
        window?.rootViewController = TabBarController()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        let registerVC = RegisterViewController()
        registerVC.delegate = self
        
        self.window = UIWindow(windowScene: sceneWindow)
        self.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        self.window?.makeKeyAndVisible()
    }

}

