//
//  NaviView.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/18.
//

import UIKit

import SnapKit
import Then

class NaviView: UIView {
    
    // MARK: - UI Components
    private let backButton = UIButton()
    private let titleLabel = UILabel()

    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NaviView {
    private func setUI() {
        backButton.do {
            $0.setBackgroundImage(Image.backButton, for: .normal)
        }
        
        titleLabel.do {
            $0.text = "뮤지컬 [삼총사]"
            $0.font = .pretendard(.bold, size: 18)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        addSubViews(backButton, titleLabel)
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(7.5)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backButton.snp.trailing)
        }
    }
}
