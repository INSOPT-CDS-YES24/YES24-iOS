//
//  SearchTableViewHeaderView.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/24.
//

import UIKit

enum SearchTableViewHeaderType {
    case recentConcert
    case popularTerm
}
class SearchTableViewHeaderView: UITableViewHeaderFooterView {

    private var headerType: SearchTableViewHeaderType?
    private let titleLabel: UILabel = UILabel()
    private let allDeleteButton: UIButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SearchTableViewHeaderView {
    public func setDataBind(headerType: SearchTableViewHeaderType) {
        switch headerType {
        case .recentConcert:
            titleLabel.text = Const.String.recentViewedProduct
            allDeleteButton.setTitle(Const.String.allDelete, for: .normal)
        case .popularTerm:
            titleLabel.text = Const.String.realTimePopularTerm
        }
    }
    private func setUI(){
        titleLabel.do {
            $0.font = .pretendard(.bold, size: 18)
        }
        allDeleteButton.do {
            $0.titleLabel?.font = .pretendard(.medium, size: 12)
        }
    }
    private func setLayout(){
        addSubViews(titleLabel, allDeleteButton)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(37)
        }
        allDeleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-11)
        }
    }
}
