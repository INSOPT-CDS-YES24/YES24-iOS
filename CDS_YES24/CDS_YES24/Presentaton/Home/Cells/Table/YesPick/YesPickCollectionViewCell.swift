//
//  YesPickCollectionViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/22.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class YesPickCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "YesPickCollectionViewCell"
    
    private let yesPickImage = UIImageView()

    private let yesPickContent = UILabel().then {
        $0.textColor = Color.yesMain
        $0.font = UIFont.pretendard(.medium, size: 12)
        $0.textAlignment = .left
    }
    
    private let yesPickTitle = UILabel().then {
        $0.textColor = Color.yesBrownishGrey
        $0.font = UIFont.pretendard(.medium, size: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }
    
    private let yesPickPeriod = UILabel().then {
        $0.textColor = .systemGray
        $0.textAlignment = .left
        $0.font = UIFont.pretendard(.regular, size: 12)
        $0.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension YesPickCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [yesPickImage, yesPickContent, yesPickTitle, yesPickPeriod].forEach {
            contentView.addSubview($0)
        }
        
        yesPickImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(126)
            make.height.equalTo(160)
        }
        
        yesPickContent.snp.makeConstraints { make in
            make.top.equalTo(yesPickImage.snp.bottom).offset(9)
            make.leading.equalToSuperview()
        }
        
        yesPickTitle.snp.makeConstraints { make in
            make.top.equalTo(yesPickImage.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(126)
            make.height.equalTo(40)
        }
        
        yesPickPeriod.snp.makeConstraints { make in
            make.top.equalTo(yesPickTitle.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(126)
            make.height.equalTo(12)
        }
    }
    
    func dataBind(model: YesPickModel) {
        yesPickImage.image = UIImage(named: model.yesPickImage)
        yesPickContent.text = model.content
        yesPickTitle.text = model.title
        yesPickPeriod.text = model.period
    }
}
