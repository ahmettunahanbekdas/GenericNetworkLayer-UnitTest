//
//  UserListBuilder.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 26.09.2024.
//

import Foundation

final class UserListBuilder {
    static func make() -> UserListViewController {
        let viewController = UserListViewController()
        viewController.viewModel = UserListViewModel(service: app.service)
        return viewController
    }
}
