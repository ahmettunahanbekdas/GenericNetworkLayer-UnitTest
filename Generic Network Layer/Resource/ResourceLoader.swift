//
//  ResourceLoader.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 4.10.2024.
//

import Foundation

class ResourceLoader {
    
    enum UserResource: String {
        case user1
    }
    
    static func userLoader(resource: UserResource) throws -> User {
        let bundle = Bundle.test
        guard let url = bundle.url(forResource: resource.rawValue, withExtension: "json") else {
            throw NSError(domain: "Invalid URL", code: 404, userInfo: nil)
        }
        let data = try Data(contentsOf: url)
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
