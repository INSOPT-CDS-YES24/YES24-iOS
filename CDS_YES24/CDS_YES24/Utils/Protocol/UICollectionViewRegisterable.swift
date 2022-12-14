//
//  UICollectionViewRegisterable.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import Foundation

import UIKit

protocol UICollectionViewRegisterable {
    static var isFromNib: Bool { get }
    static func register(target: UICollectionView)
}

extension UICollectionViewRegisterable where Self: UICollectionViewCell {
    static func register(target: UICollectionView) {
        if self.isFromNib {
            print(self.className, "1111")
          target.register(UINib(nibName: Self.className, bundle: nil), forCellWithReuseIdentifier: Self.className)
        } else {
            print(self.className, "22222")
          target.register(Self.self, forCellWithReuseIdentifier: Self.className)
        }
    }
}
