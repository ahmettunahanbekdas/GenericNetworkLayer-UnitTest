//
//  MoviePresentation.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 27.09.2024.
//

import Foundation

class UserPresentation {
    let title: String
    let phone: String
    
    init(title: String, phone: String) {
        self.title = title
        self.phone = phone
    }
    
    convenience init(user: User) {
        self.init(title: user.name!, phone: user.phone!)
    }
}
