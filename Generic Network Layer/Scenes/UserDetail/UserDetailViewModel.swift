//
//  UserDetailViewModel.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import Foundation

final class UserDetailViewModel: UserDetailViewModelProtocol{
    weak var delegate: UserDetailViewModelDelegate?
    var presentation: UserDetailPresentation?
    
    init(user: User) {
        self.presentation = UserDetailPresentation(user: user)
    }
    
    func load() {
        guard let presentation = presentation else {
            print("Error: Presentation is nil")
            return
        }
        delegate?.showDetail(presentation)
    }
}
