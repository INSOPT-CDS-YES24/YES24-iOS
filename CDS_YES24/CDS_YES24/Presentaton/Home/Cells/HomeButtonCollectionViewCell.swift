//
//  HomeButtonCollectionViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

class HomeButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeButtonCollectionViewCell"
    
    private let buttonIcon = UIImageView()
    private let buttonLabel = UILabel().then {
        $0.textColor = Color.yesBrownishGrey
        $0.font = UIFont.pretendard(.medium, size: 14)
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

extension HomeButtonCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [buttonIcon, buttonLabel].forEach {
            contentView.addSubview($0)
        }
        
        buttonIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
//            make.leading.equalToSuperview().offset(37)
            make.centerX.equalToSuperview()
        }
        
        buttonLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonIcon.snp.bottom).offset(1)
//            make.leading.equalTo(buttonIcon)
            make.centerX.equalToSuperview()
        }
    }
    
    func dataBind(model: HomeButtonModel){
        buttonIcon.image = UIImage(named: model.buttonIcon)
        buttonLabel.text = model.buttonLabel
    }
}
