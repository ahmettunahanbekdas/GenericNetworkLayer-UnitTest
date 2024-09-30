//
//  UserListCell.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import UIKit

final class UserListCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseIdentifier = "UserListCell"
    private var user: UserPresentation!
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserListCell {
    // MARK: - Configuration Methods
    func configureCell() {
        backgroundColor = .systemGray3
        setupNameLabel()
        setupPhoneLabel()
    }
    func setUser(_ user: UserPresentation) {
        self.user = user
        nameLabel.text = user.title
        phoneNumber.text = user.phone
        layer.cornerRadius = CGFloat.dWidth/10
    }
    // MARK: - Setup Methods
    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

        ])
    }
    
    private func setupPhoneLabel() {
        contentView.addSubview(phoneNumber)
        NSLayoutConstraint.activate([
            phoneNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: CGFloat.dWidth/100),
            phoneNumber.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
}
