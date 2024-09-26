//
//  AppContainer.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 26.09.2024.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let service = UserService()
    let router = AppRouter()
}
