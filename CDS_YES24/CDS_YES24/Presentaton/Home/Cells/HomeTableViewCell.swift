//
//  HomeTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    // showGalleryCollectionView
    private lazy var showGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemRed
        return collectionView
    }()
    
    // homeButtonCollectionView
    private lazy var homeButtonCollectionView: UIView = {
        let layout = UICollectionViewLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    // yesPickCollectionView
    private lazy var yesPickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    // recentShowCollectionView
    private lazy var recentShowCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
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

extension HomeTableViewCell {
    private func layout() {
        backgroundColor = .clear
        
        [showGalleryCollectionView, homeButtonCollectionView,
         yesPickCollectionView, recentShowCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        showGalleryCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(515)
        }
        
        homeButtonCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(230)
        }
        
        yesPickCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(390)
        }
        
        recentShowCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(390)
        }
    }
}
