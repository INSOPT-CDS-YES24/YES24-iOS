//
//  HomeButtonTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class HomeButtonTableViewCell: UITableViewCell {

    static let identifier = "HomeButtonTableViewCell"
    
    // homeButtonCollectionView
    private lazy var homeButtonCollectionView: UIView = {
        let layout = UICollectionViewLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension HomeButtonTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(homeButtonCollectionView)
        
        homeButtonCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.bottom
                .equalToSuperview()
        }
    }
}
