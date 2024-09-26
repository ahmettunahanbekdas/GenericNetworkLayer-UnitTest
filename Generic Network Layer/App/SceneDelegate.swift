//
//  SceneDelegate.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow.init(windowScene: windowScene)
        app.router.start()
    }
}

