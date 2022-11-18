//
//  HomeButtonCollectionViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class HomeButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeButtonCollectionViewCell"
    
    private let homeButtonContainerView = UIView()
    private let homeButtonImage = UIImageView()
    private let homeButtonTitle = UILabel().then {
        $0.textColor = .black
        $0.font = .pretendard(.medium, size: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
    
    extension HomeButtonCollectionViewCell {
        private func layout() {
            backgroundColor = .clear
            contentView.backgroundColor = .clear
            [homeButtonContainerView, homeButtonImage, homeButtonTitle].forEach {
                contentView.addSubview($0)
            }
            
            homeButtonContainerView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview()
                make.width.height.equalTo(130)
            }
            
            homeButtonImage.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.top.equalToSuperview().offset(24)
                make.width.equalTo(54)
            }
            
            homeButtonTitle.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.top.equalTo(homeButtonImage.snp.bottom).offset(3)
            }
        }
        
        func dataBind(model: HomeButtonModel) {
            homeButtonImage.image = UIImage(named: model.buttonImage)
            homeButtonTitle.text = model.buttonTitle
        }
}
