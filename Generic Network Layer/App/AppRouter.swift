//
//  AppRouter.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 26.09.2024.
//

import Foundation
import UIKit

final class AppRouter {
    func start() {
        let viewController = UserListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
