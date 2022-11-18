//
//  HomeButtonCollectionViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

class HomeButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeButtonCollectionViewCell"
    
    private let HomeButtonContainerView = UIView()
    private let buttonIcon = UIImageView()
    private let buttonLabel = UILabel().then {
        $0.textColor = Color.yesBrownishGrey
        $0.font = UIFont.pretendard(.medium, size: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension HomeButtonCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [HomeButtonContainerView, buttonIcon, buttonLabel].forEach {
            contentView.addSubview($0)
        }
        
        HomeButtonContainerView.addSubview(buttonIcon)
        HomeButtonContainerView.addSubview(buttonLabel)
        HomeButtonContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        buttonIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
        }
        
        buttonLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonIcon.snp.bottom).offset(1)
        }
    }
    
    func dataBind(model: HomeButtonModel){
        buttonIcon.image = UIImage(named: model.buttonIcon)
        buttonLabel.text = model.buttonLabel
    }
}
