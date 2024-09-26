//
//  UserServie.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 26.09.2024.
//

import Foundation


protocol UserServiceProtocol {
    func getUser(complation: @escaping (Result<[User], NetworkError>) -> Void)
}
final class UserService: UserServiceProtocol {
    func getUser(complation: @escaping (Result<[User], NetworkError>) -> Void) {
        let endPoint = EndPoint.getUser
        NetworkManager.shared.request(endPoint, completion: complation)
    }
}
