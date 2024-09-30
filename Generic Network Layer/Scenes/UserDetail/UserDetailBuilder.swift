//
//  UserDetailBuilder.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import Foundation

final class UserDetailBuilder {
    static func make(viewModel: UserDetailViewModelProtocol) -> UserDetailViewController {
        let viewController = UserDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}


