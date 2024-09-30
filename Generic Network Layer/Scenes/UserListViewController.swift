//
//  ViewController.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import UIKit

class UserListViewController: UIViewController {
   
    // MARK: - Properties
    var collectionView: UICollectionView!
    private var users: [UserPresentation] = []

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
        configureCollectionView()
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

extension UserListViewController {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHelper.CreateUserListFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        view.pinToEdgesOf(view: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension UserListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
           cell.backgroundColor = .blue
           return cell
       }
}
