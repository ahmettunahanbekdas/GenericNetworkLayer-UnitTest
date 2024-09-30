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
    
    func navigate(to route: UserListViewRoute) {
        switch route {
        case.toDetail(let viewModel):
            let viewController = UserDetailBuilder.make(viewModel: viewModel)
            show(viewController, sender: nil)
            break
        }
    }
    
    
    // MARK: - Handle ViewModel Output
    func handleViewModelOutput(_ output: UserListViewModelOutput) {
        switch output {
        case .showUser(let user):
            self.users = user
            DispatchQueue.main.async { // Ana iş parçacığına geçiyoruz
                self.collectionView.reloadData() // Veriler geldikten sonra CollectionView'i yeniden yükleyin
            }
        case .updateTitle(let title):
            DispatchQueue.main.async { // Ana iş parçacığına geçiyoruz
            self.title = title
            }
        }
    }
}

extension UserListViewController {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHelper.CreateUserListFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UserListCell.self, forCellWithReuseIdentifier: UserListCell.reuseIdentifier)
        
        view.addSubview(collectionView)
        view.pinToEdgesOf(view: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension UserListViewController: UICollectionViewDelegate   {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count
    }
}

extension UserListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserListCell.reuseIdentifier, for: indexPath) as? UserListCell else {
            return UICollectionViewCell()
        }
        cell.setUser(self.users[indexPath.item])
        return cell
    }
}

extension UserListViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndex = indexPath.item
        viewModel.selectedUser(at: selectedIndex)
    }
}

