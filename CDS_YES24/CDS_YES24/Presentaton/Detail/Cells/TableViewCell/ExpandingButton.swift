//
//  ExpandingButton.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/23.
//

import UIKit

import Then
import SnapKit

class ExpandingButton: UIButton {
    
    private let expandingButton = UIButton()
    private let expandingLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExpandingButton {
    private func setUI() {
        expandingButton.do {
            $0.setImage(Image.expadingButton, for: .normal)
        }
        
        expandingLabel.do {
            $0.text = "펼치기"
            $0.font = .pretendard(.bold, size: 16)
            $0.textColor = Color.yesGrey
        }
    }
    
    private func setLayout() {
        addSubViews(expandingButton, expandingLabel)
        
        expandingButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
            $0.leading.equalToSuperview().inset(128)
        }
        
        expandingLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
