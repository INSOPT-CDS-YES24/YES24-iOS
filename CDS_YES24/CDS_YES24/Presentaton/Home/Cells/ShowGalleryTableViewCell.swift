//
//  ShowGalleryTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class ShowGalleryTableViewCell: UITableViewCell {
    
    static let identifier = "ShowGalleryTableViewCell"
    static let homeLogo24Ticket = UIImageView()
    
    // showGalleryCollectionView
    private lazy var showGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemRed
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

extension ShowGalleryTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(showGalleryCollectionView)
        
        showGalleryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
