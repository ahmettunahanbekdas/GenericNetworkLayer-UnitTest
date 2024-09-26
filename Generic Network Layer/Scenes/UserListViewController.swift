//
//  ViewController.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import UIKit

class UserListViewController: UIViewController {
    
    // MARK: - Properties
    private var users: [User] = []
    
    var viewModel: UserListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.loadUserList()
    }
}

// MARK: - UserListViewModelDelegate
extension UserListViewController: UserListViewModelDelegate {
    
    // MARK: - Handle ViewModel Output
    func handleViewModelOutput(_ output: UserListViewModelOutput) {
        switch output {
        case .showUser(let user):
            self.users = user
            print(self.users)
        case .updateTitle(_):
            // TODO: Implement.
            break
        }
    }
}
