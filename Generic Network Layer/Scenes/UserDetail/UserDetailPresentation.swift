//
//  UserDetailPresentation.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import Foundation

struct UserDetailPresentation {
    let name: String
    let street: String
    let suite: String
    let city: String
}

extension UserDetailPresentation {
    init(user: User) {
        self.name = user.name!
        self.street = (user.address?.street)!
        self.suite = (user.address?.suite)!
        self.city = (user.address?.city)!
    }
}


