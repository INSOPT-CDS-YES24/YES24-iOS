//
//  ReserveButton.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/23.
//

import UIKit

import SnapKit

class ReserveButton: UIButton {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ReserveButton {
    private func setUI() {
        setTitle("예매하기", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .pretendard(.bold, size: 20)
        backgroundColor = Color.yesMain
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.12
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowRadius = 28.0 / UIScreen.main.scale
    }
}
