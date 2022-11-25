//
//  SearchViewController.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

final class SearchViewController: UIViewController {
    
    private let titleLabel: UILabel = UILabel()
    private let searchBar = UISearchBar()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}
extension SearchViewController{
    // MARK: - View 속성 설정
    private func setUI(){
        view.backgroundColor = .white
        titleLabel.do {
            $0.text = Const.String.search
            $0.font = UIFont.pretendard(.bold, size: 18)
        }
        searchBar.do {
            $0.searchBarStyle = .minimal
        }
    }
    
    private func setLayout(){
        view.addSubViews(titleLabel, searchBar)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
}
