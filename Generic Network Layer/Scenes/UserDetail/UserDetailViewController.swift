//
//  UserDetailView.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import UIKit

class UserDetailViewController: UIViewController {
    var streetLabel = UILabel()
    var suiteLabel = UILabel()
    var cityLabel = UILabel()


    var viewModel: UserDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel.load()
        setupView()
    }
}

extension UserDetailViewController: UserDetailViewModelDelegate {
    func showDetail(_ presentation: UserDetailPresentation) {
        title = presentation.name
        configureLabel(streetLabel, title: "Street: ", value: presentation.street)
        configureLabel(suiteLabel, title: "Suite: ", value: presentation.suite)
        configureLabel(cityLabel, title: "City: ", value: presentation.city)
    }
}

extension UserDetailViewController {
    func setupView() {
         setupLabels()
    }
    
    func setupLabels() {
        let labels = [streetLabel, suiteLabel, cityLabel]
        
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
        }
        NSLayoutConstraint.activate([
            streetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .dWidth * 0.05),
            streetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: .dHeight * 0.2),
            suiteLabel.leadingAnchor.constraint(equalTo: streetLabel.leadingAnchor),
            suiteLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: .dHeight * 0.02),
            cityLabel.leadingAnchor.constraint(equalTo: streetLabel.leadingAnchor),
            cityLabel.topAnchor.constraint(equalTo: suiteLabel.bottomAnchor, constant: .dHeight * 0.02)
        ])
    }

    func configureLabel(_ label: UILabel, title: String, value: String) {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.boldSystemFont(ofSize: .dHeight * 0.025)])
        attributedString.append(NSAttributedString(string: value, attributes: [.font: UIFont.systemFont(ofSize: .dHeight * 0.025)]))
        label.attributedText = attributedString
    }
}
