//
//  ViewModel.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import Foundation

protocol UserListViewModelProtocol: AnyObject {
    var delegate: UserListViewModelDelegate? { get set }
    func loadUserList()
}

protocol  UserListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: UserListViewModelOutput)
}

enum UserListViewModelOutput {
    case updateTitle(String)
    case showUser([User])
}

class UserListViewModel: UserListViewModelProtocol {
    weak var delegate: UserListViewModelDelegate?
    let service =  UserService()
    //    private let service: UserService
    //
    //    init(service: UserService) {
    //        self.service = service
    //    }
    
    func loadUserList() {
        notify(.updateTitle("Users"))
        service.getUser { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let result):
                self.notify(.showUser(result))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func notify(_ output: UserListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
