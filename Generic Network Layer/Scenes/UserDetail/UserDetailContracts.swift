//
//  UserDetailContracts.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import Foundation

protocol UserDetailViewModelProtocol: AnyObject {
    var delegate: UserDetailViewModelDelegate? { get set }
    func load()
}

protocol UserDetailViewModelDelegate: AnyObject {
    func showDetail(_ presentation: UserDetailPresentation)
}
