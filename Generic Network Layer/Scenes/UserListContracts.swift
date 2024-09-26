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
}

protocol  UserListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: UserListViewModelOutput)
}
