//
//  ShowGalleryCollectionViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/21.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class ShowGalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShowGalleryCollectionViewCell"
    
    private let galleryImage = UIImageView()
    private let galleryTitle = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.pretendard(.bold, size: 18)
        $0.textAlignment = .center
    }
    
    private let galleryPeriod = UILabel().then {
        $0.textColor = .systemGray
        $0.font = UIFont.pretendard(.regular, size: 14)
        $0.textAlignment = .center
    }
    
    private let galleryPlace = UILabel().then {
        $0.textColor = .systemGray
        $0.font = UIFont.pretendard(.regular, size: 14)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension ShowGalleryCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [galleryImage, galleryTitle, galleryPeriod,
         galleryPlace].forEach {
            contentView.addSubview($0)
        }
        
        galleryImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(204)
        }
        
        galleryTitle.snp.makeConstraints { make in
            make.top.equalTo(galleryImage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        galleryPeriod.snp.makeConstraints { make in
            make.top.equalTo(galleryTitle.snp.bottom).offset(11)
            make.centerX.equalToSuperview()
        }
        
        galleryPlace.snp.makeConstraints { make in
            make.top.equalTo(galleryPeriod.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
    }
    
    func dataBind(model: ShowGalleryModel) {
        galleryImage.image = UIImage(named: model.galleryImage)
        galleryTitle.text = model.title
        galleryPeriod.text = model.period
        galleryPlace.text = model.place
    }
}
