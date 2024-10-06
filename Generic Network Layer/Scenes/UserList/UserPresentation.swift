//
//  MoviePresentation.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 27.09.2024.
//

import Foundation

class UserPresentation: NSObject {
    let title: String
    let phone: String
    
    init(title: String, phone: String) {
        self.title = title
        self.phone = phone
    }
    
    convenience init(user: User) {
        self.init(title: user.name!, phone: user.phone!)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? UserPresentation else { return false }
        return self.title == other.title && self.phone == other.phone
    }
}
