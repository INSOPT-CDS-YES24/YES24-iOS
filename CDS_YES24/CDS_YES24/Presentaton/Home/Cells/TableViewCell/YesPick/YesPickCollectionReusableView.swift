//
//  YesPickCollectionReusableView.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/22.
//

import UIKit

import SnapKit
import SwiftyColor
import Then
import Foundation

class YesPickCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "YesPickCollectionReusableView"
    
    // yesPick
    private let yesPickLogo = UIImageView().then {
        $0.image = Image.yesPick
    }
    
    private let favoriteLabel = UILabel().then {
        $0.text = """
                평소 선호하시는
                뮤지컬 장르의 인기 공연이에요.
                """
        $0.font = UIFont.pretendard(.bold, size: 18)
        $0.textColor = Color.yesLightGrey
    }
    
    private let moreLabel = UIImageView().then {
        $0.image = Image.rightButtonBlack
    }
    
//    lazy var attributedStr = NSMutableAttributedString(string: favoriteLabel.text!)
//    attributedStr.addAttribute(.foregroundColor, value: Color.yesMain,
//                               range: (favoriteLabel.text! as NSString).range(of: "뮤지컬"))
//    favoriteLabel.attributedText = attributeStr
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension YesPickCollectionReusableView {
    private func layout() {
        backgroundColor = .red
        [yesPickLogo, favoriteLabel, moreLabel].forEach {
            addSubview($0)
        }
        
        yesPickLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        favoriteLabel.snp.makeConstraints { make in
            make.top.equalTo(yesPickLogo.snp.bottom).offset(13)
            make.leading.equalTo(yesPickLogo)
        }
        
        moreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(7)
        }
    }
}
