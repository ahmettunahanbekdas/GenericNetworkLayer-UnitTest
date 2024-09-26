//
//  ViewController.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import UIKit

class UserListViewController: UIViewController {
    
    private var users: [User] = []
    var viewModel = UserListViewModel()
    
    
//    var viewModel: ViewModelProtocol! {
//        didSet{
//            viewModel.delegate = self
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = .red
        viewModel.loadUserList()
    }
}

extension UserListViewController: UserListViewModelDelegate {
    func handleViewModelOutput(_ output: UserListViewModelOutput) {
        switch output {
        case .showUser(let user):
            self.users = user
            print(self.users)
        case .updateTitle(let title):
            break
        }
    }
}

