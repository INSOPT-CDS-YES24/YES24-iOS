//
//  ShowDetailTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import UIKit

import Then
import SnapKit

class ShowDetailTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let titleLabel = UILabel()
    private let posterImageView = UIImageView()
    private let expandButton = ExpandingButton()
    private let stackView = UIStackView()
    
    var isFold: Bool = false
    var clickedEvent: ((Int) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShowDetailTableViewCell {
    private func setUI() {
        titleLabel.do {
            $0.font = .pretendard(.bold, size: 14)
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
            $0.text = "상세정보"
            $0.sizeToFit()
        }
        
        stackView.do {
            $0.spacing = 0
            $0.axis = .vertical
            $0.distribution = .fill
        }
        
        posterImageView.do {
            $0.image = Image.detailPoster
            $0.clipsToBounds = true
            $0.contentMode = .top
        }
    }
    
    private func setLayout() {
        [posterImageView, expandButton].forEach {
            stackView.addArrangedSubview($0)
        }
        contentView.addSubViews(titleLabel, stackView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(14)
        }
        
        expandButton.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(26)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func updateLayout() {
        posterImageView.snp.updateConstraints {
            $0.height.equalTo(isFold ? 194 : 612)
        }
    }
}
