//
//  InfoTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

class InfoTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let titleLabel = UILabel()
    let heartButton = UIButton()
    private let shareButton = UIButton()
    private let calendarIcon = UIImageView()
    private let placeIcon = UIImageView()
    private let dateLabel = UILabel()
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

extension InfoTableViewCell {
    private func setUI() {
        titleLabel.do {
            $0.textColor = Color.yesGrey
            $0.font = .pretendard(.bold, size: 20)
            $0.text = "뮤지컬[삼총사]"
        }
        
        heartButton.do {
            $0.setImage(Image.heart, for: .normal)
            $0.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        }
        
        shareButton.setImage(Image.shareButton, for: .normal)
        calendarIcon.image = Image.calendar
        placeIcon.image = Image.loction
        
        [dateLabel, placeLabel].forEach {
            $0.font = .pretendard(.medium, size: 14)
            $0.textColor = Color.yesGrey
        }
        
        dateLabel.text = "2022.11.22 - 2022.12.23"
        placeLabel.text = "유니버설아트센터 대극장"
    }
    
    private func setLayout() {
        contentView.addSubViews(titleLabel, heartButton, shareButton,
                                calendarIcon, placeIcon, dateLabel, placeLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalToSuperview().inset(20)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.trailing.equalToSuperview().inset(5)
            $0.size.equalTo(40)
        }
        
        heartButton.snp.makeConstraints {
            $0.centerY.equalTo(shareButton.snp.centerY)
            $0.trailing.equalTo(shareButton.snp.leading).offset(-4)
            $0.size.equalTo(40)
        }
        
        calendarIcon.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(19)
            $0.size.equalTo(20)
        }
        
        placeIcon.snp.makeConstraints {
            $0.top.equalTo(calendarIcon.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(19)
            $0.size.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(calendarIcon.snp.centerY)
            $0.leading.equalTo(calendarIcon.snp.trailing).offset(9)
        }
        
        placeLabel.snp.makeConstraints {
            $0.centerY.equalTo(placeIcon.snp.centerY)
            $0.leading.equalTo(placeIcon.snp.trailing).offset(9)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    @objc func didTapHeartButton(_ sender: UIButton) {
        var backgroundImage = sender.isSelected ? Image.fillHeart : Image.heart
        heartButton.setImage(backgroundImage, for: .normal)
    }
}
