//
//  CollectionViewHelper.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 27.09.2024.
//

import UIKit

enum CollectionViewHelper {
    static func CreateUserListFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let dWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: dWidth, height: dWidth/3)
        layout.minimumLineSpacing = dWidth/10
        return layout
    }
}
