//
//  UserListContracts.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 26.09.2024.
//

import Foundation


protocol UserListViewModelProtocol: AnyObject {
    var delegate: UserListViewModelDelegate? { get set }
    func loadUserList()
    func selectedUser(at index: Int)
}

protocol UserListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: UserListViewModelOutput)
    func navigate(to route: UserListViewRoute)
}

enum UserListViewModelOutput: Equatable {
    case updateTitle(String)
    case showUser([UserPresentation])
}

enum UserListViewRoute {
    case toDetail(UserDetailViewModelProtocol)
}
