//
//  ShowInfoTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

class ShowInfoTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let titleLabel = UILabel()
    private let hostTitleLabel = UILabel()
    private let hostLabel = UILabel()
    private let callCenterTitleLabel = UILabel()
    private let callCenterLabel = UILabel()
    private let ageLimitTitleLabel = UILabel()
    private let ageLimitLabel = UILabel()
    private let placeTitleLabel = UILabel()
    private let placeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShowInfoTableViewCell {
    private func setUI() {
        titleLabel.do {
            $0.font = .pretendard(.bold, size: 14)
            $0.text = "상품 관련 정보"
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
        }
        
        [hostTitleLabel, callCenterTitleLabel, ageLimitTitleLabel, placeTitleLabel].forEach {
            $0.textColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
            $0.font = .pretendard(.bold, size: 14)
        }
        
        [hostLabel, callCenterLabel, ageLimitLabel, placeLabel].forEach {
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
            $0.font = .pretendard(.bold, size: 14)
        }
        
        hostTitleLabel.text = "주최/기획"
        callCenterTitleLabel.text = "소비자상담"
        ageLimitTitleLabel.text = "관람등급"
        placeTitleLabel.text = "공연장소"
        
        hostLabel.text = ""
        callCenterLabel.text = ""
        ageLimitLabel.text = ""
        placeLabel.text = ""
    }
    
    private func setLayout() {
        contentView.addSubViews(titleLabel, hostLabel, hostTitleLabel,
                                callCenterLabel, callCenterTitleLabel, ageLimitLabel,
                                ageLimitTitleLabel, placeLabel, placeTitleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        hostTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        callCenterTitleLabel.snp.makeConstraints {
            $0.top.equalTo(hostTitleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        ageLimitTitleLabel.snp.makeConstraints {
            $0.top.equalTo(callCenterTitleLabel.snp.bottom).offset(47)
            $0.leading.equalToSuperview().inset(20)
        }
        
        placeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(ageLimitTitleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        hostLabel.snp.makeConstraints {
            $0.centerY.equalTo(hostTitleLabel.snp.centerY)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        callCenterLabel.snp.makeConstraints {
            $0.centerY.equalTo(callCenterTitleLabel.snp.centerY)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        ageLimitLabel.snp.makeConstraints {
            $0.centerY.equalTo(ageLimitTitleLabel.snp.centerY)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        placeLabel.snp.makeConstraints {
            $0.centerY.equalTo(placeTitleLabel.snp.centerY)
            $0.leading.equalTo(placeTitleLabel.snp.trailing).offset(50)
            $0.bottom.equalToSuperview().inset(142)
        }
    }
}
