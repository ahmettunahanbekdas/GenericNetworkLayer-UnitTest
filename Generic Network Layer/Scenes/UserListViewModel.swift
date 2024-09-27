//
//  ViewModel.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import Foundation

// MARK: - ViewModel Output Enum
enum UserListViewModelOutput {
    case updateTitle(String)
    case showUser([UserPresentation])

}

// MARK: - ViewModel Class
class UserListViewModel: UserListViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: UserListViewModelDelegate?
    private let service: UserServiceProtocol
    
    // MARK: - Initializer
    init(service: UserService) {
        self.service = service
    }
    
    // MARK: - Load User List
    func loadUserList() {
        notify(.updateTitle("Users"))
        service.getUser { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let result):
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
}
