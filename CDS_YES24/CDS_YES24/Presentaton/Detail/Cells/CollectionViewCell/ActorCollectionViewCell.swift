//
//  ActorCollectionViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

class ActorCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    static var isFromNib: Bool = false
    
    private let actorImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ActorCollectionViewCell {
    func configure(_ model: Actor) {
        actorImageView.image = model.actorImage
    }
    
    private func setLayout() {
        contentView.addSubViews(actorImageView)
        
        actorImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
