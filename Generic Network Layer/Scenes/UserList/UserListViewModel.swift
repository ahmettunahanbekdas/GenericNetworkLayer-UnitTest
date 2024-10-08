//
//  ViewModel.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import Foundation
// MARK: - ViewModel Class
final class UserListViewModel: UserListViewModelProtocol {

    var userList:[User] = []
    
    // MARK: - Properties
    weak var delegate: UserListViewModelDelegate?
    private let service: UserServiceProtocol
    
    // MARK: - Initializer
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    // MARK: - Load User List
    func loadUserList() {
        service.getUser { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let result):
                self.notify(.updateTitle("Users"))
                self.userList = result
                let presentation = result.map({UserPresentation(user: $0)})
                self.notify(.showUser(presentation))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Notify Delegate
    func notify(_ output: UserListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
    // MARK: - SelectedUser
    func selectedUser(at index: Int) {
        let selectedUser = self.userList[index]
        let viewModel = UserDetailViewModel(user: selectedUser)
        delegate?.navigate(to: .toDetail(viewModel))
    }
}
