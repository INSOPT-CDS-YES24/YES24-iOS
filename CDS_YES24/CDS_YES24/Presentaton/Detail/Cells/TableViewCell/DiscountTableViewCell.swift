//
//  DiscountTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

class DiscountTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let titleLabel = UILabel()
    private let couponView = UIView()
    private let usableCouponLabel = UILabel()
    private let detailButton = UIButton()
    private let couponImageView = UIImageView()
    private let expandButton = ExpandingButton()
    private let stackView = UIStackView()
    
    var isFold: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DiscountTableViewCell {
    private func setUI() {
        titleLabel.do {
            $0.font = .pretendard(.bold, size: 14)
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
            $0.text = "할인정보"
        }
        
        couponView.do {
            $0.layer.cornerRadius = 5
            $0.backgroundColor = Color.yesVeryLightGrey
        }
        
        usableCouponLabel.do {
            $0.font = .pretendard(.semiBold, size: 16)
            $0.textColor = Color.yesBrownishGrey
            $0.text = "사용가능한 할인 정보 2개"
        }
        
        detailButton.do {
            $0.setImage(Image.detailButton, for: .normal)
        }
        
        couponImageView.do {
            $0.image = Image.couponDetail
        }
        
        stackView.do {
            $0.spacing = 0
            $0.axis = .vertical
            $0.distribution = .fill
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(titleLabel, couponView, stackView)
        [couponImageView, expandButton].forEach {
            stackView.addArrangedSubview($0)
        }
        couponView.addSubViews(usableCouponLabel, detailButton)
        
        usableCouponLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
        
        detailButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
            $0.trailing.equalToSuperview().inset(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        couponView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(46)
        }
        
        expandButton.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(couponView.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
//
//        expandButton.snp.makeConstraints {
//            $0.top.equalTo(couponImageView.snp.bottom)
//            $0.directionalHorizontalEdges.equalToSuperview()
//            $0.height.equalTo(60)
//        }
    }
}
