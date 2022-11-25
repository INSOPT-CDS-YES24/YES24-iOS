//
//  HomeButtonTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class HomeButtonTableViewCell: UITableViewCell {

    static let identifier = "HomeButtonTableViewCell"
    
    // homeButtonCollectionView
    private lazy var homeButtonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // 이렇게 노가다 방법밖에 없는걸까..?
    var homeButtonModel: [HomeButtonModel] = [
        HomeButtonModel(buttonIcon: "homeIcConcert", buttonLabel: "콘서트"),
        HomeButtonModel(buttonIcon: "homeIcMusical", buttonLabel: "뮤지컬"),
        HomeButtonModel(buttonIcon: "homeIcPlay", buttonLabel: "연극"),
        HomeButtonModel(buttonIcon: "homeIcClassic", buttonLabel: "클래식/무용"),
        HomeButtonModel(buttonIcon: "homeIcDisplay", buttonLabel: "전시/행사"),
        HomeButtonModel(buttonIcon: "homeIcChild", buttonLabel: "아동/가족"),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        register()
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension HomeButtonTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(homeButtonCollectionView)
        
        homeButtonCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        homeButtonCollectionView.register(HomeButtonCollectionViewCell.self,
                                          forCellWithReuseIdentifier: HomeButtonCollectionViewCell.identifier)
    }
}

extension HomeButtonTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
        guard let buttonCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeButtonCollectionViewCell.identifier, for: indexPath)
                    as? HomeButtonCollectionViewCell else { return UICollectionViewCell() }
        buttonCell.dataBind(model: homeButtonModel[indexPath.item])
        return buttonCell
    }
}

extension HomeButtonTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: 123, height: 122)
    }
}
