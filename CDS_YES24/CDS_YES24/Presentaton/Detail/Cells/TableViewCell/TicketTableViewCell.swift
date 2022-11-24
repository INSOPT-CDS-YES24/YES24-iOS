//
//  TicketTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

class TicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let infoShowTitle = UILabel()
    private let subInfoTitle = UILabel()
    private let qnaTitle = UILabel()
    private let lineView = UIView()
    private let blueLineView = UIView()
    private let priceInfoLabel = UILabel()
    private let vipView = UIView()
    private let rView = UIView()
    private let sView = UIView()
    private let aView = UIView()
    private let vipLabel = UILabel()
    private let rLabel = UILabel()
    private let sLabel = UILabel()
    private let aLabel = UILabel()
    private let vipPriceLabel = UILabel()
    private let rPriceLabel = UILabel()
    private let sPriceLabel = UILabel()
    private let aPriceLabel = UILabel()
    
    private let titleStackView = UIStackView()
    private let seatViewStackView = UIStackView()
    private let seatNameStackView = UIStackView()
    private let seatPriceStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TicketTableViewCell {
    private func setUI() {
        titleStackView.do {
            $0.axis = .horizontal
            $0.spacing = 24
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement  = true
        }
        
        seatViewStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.distribution = .fill
        }
        
        [seatNameStackView, seatPriceStackView].forEach {
            $0.axis = .vertical
            $0.spacing = 8
            $0.distribution = .fillEqually
        }
        
        [subInfoTitle, qnaTitle].forEach {
            $0.textColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
            $0.font = .pretendard(.semiBold, size: 16)
        }
        
        subInfoTitle.text = "부가정보"
        qnaTitle.text = "Q&A"
        
        priceInfoLabel.do {
            $0.font = .pretendard(.bold, size: 14)
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
            $0.text = "가격정보"
        }
        
        infoShowTitle.do {
            $0.font = .pretendard(.bold, size: 16)
            $0.text = "공연정보"
            $0.textColor = Color.yesMain
        }
        
        lineView.backgroundColor = Color.yesVeryLightGrey
        blueLineView.backgroundColor = Color.yesMain
        vipView.backgroundColor = UIColor(red: 255/255, green: 86/255, blue: 127/255, alpha: 1)
        rView.backgroundColor = UIColor(red: 140/255, green: 86/255, blue: 255/255, alpha: 1)
        sView.backgroundColor = UIColor(red: 80/255, green: 139/255, blue: 250/255, alpha: 1)
        aView.backgroundColor = UIColor(red: 255/255, green: 206/255, blue: 86/255, alpha: 1)
        
        [vipLabel, rLabel, sLabel, aLabel,
         vipPriceLabel, rPriceLabel, sPriceLabel, aPriceLabel].forEach {
            $0.font = .pretendard(.medium, size: 14)
            $0.textColor = Color.yesGrey
        }
        
        vipLabel.text = "VIP석"
        rLabel.text = "R석"
        sLabel.text = "S석"
        aLabel.text = "A석"
        
        vipPriceLabel.text = "150,000원"
        rPriceLabel.text = "120,000원"
        sPriceLabel.text = "90,000원"
        aPriceLabel.text = "70,000원"
        
    }
    
    private func setLayout() {
        [infoShowTitle, subInfoTitle, qnaTitle].forEach {
            titleStackView.addArrangedSubview($0)
        }
        
        [vipView, rView, sView, aView].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(14)
            }
            seatViewStackView.addArrangedSubview($0)
        }
        
        [vipLabel, rLabel, sLabel, aLabel].forEach {
            seatNameStackView.addArrangedSubview($0)
        }

        [vipPriceLabel, rPriceLabel, sPriceLabel, aPriceLabel].forEach {
            seatPriceStackView.addArrangedSubview($0)
        }
        
        contentView.addSubViews(titleStackView, priceInfoLabel, lineView,
                                blueLineView, seatViewStackView, seatNameStackView,
                                seatPriceStackView)
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.lessThanOrEqualTo(30).priority(.required)
        }

        lineView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(5)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }

        blueLineView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.top)
            $0.height.equalTo(2)
            $0.leading.equalTo(21)
            $0.width.equalTo(infoShowTitle.snp.width)
        }

        priceInfoLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(17)
        }
        
        seatViewStackView.snp.makeConstraints {
            $0.top.equalTo(priceInfoLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(26).priority(.high)
        }

        seatNameStackView.snp.makeConstraints {
            $0.top.equalTo(priceInfoLabel.snp.bottom).offset(15)
            $0.leading.equalTo(seatViewStackView.snp.trailing).offset(10)
            $0.bottom.equalToSuperview().inset(24).priority(.high)
            $0.height.equalTo(96)
        }

        seatPriceStackView.snp.makeConstraints {
            $0.top.equalTo(priceInfoLabel.snp.bottom).offset(15)
            $0.leading.equalTo(seatNameStackView.snp.trailing).offset(42)
            $0.bottom.equalToSuperview().inset(24).priority(.high)
            $0.height.equalTo(96)
        }
    }
}
