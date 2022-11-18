//
//  YesPickTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class YesPickTableViewCell: UITableViewCell {
    
    static let identifier = "YesPickTableViewCell"
    
    // yesPickCollectionView
    private lazy var yesPickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        
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

extension YesPickTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(yesPickCollectionView)
        
        yesPickCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
