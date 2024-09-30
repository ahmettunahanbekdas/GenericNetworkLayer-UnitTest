//
//  CollectionView+Ext.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 30.09.2024.
//

import UIKit

extension UICollectionView {
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
