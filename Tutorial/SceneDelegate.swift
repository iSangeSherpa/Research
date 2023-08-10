//
//  SceneDelegate.swift
//  Tutorial
//
//  Created by Sange Sherpa on 04/08/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let mainTableController = NavigationViewController()
        let rootController = UINavigationController(rootViewController: mainTableController)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}

