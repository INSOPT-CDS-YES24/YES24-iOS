//
//  YesPickTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class YesPickTableViewCell: UITableViewCell {
    
    static let identifier = "YesPickTableViewCell"
    
    // yesPickCollectionView
    private lazy var yesPickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var yesPickModel: [YesPickModel] = [
        YesPickModel(yesPickImage: "maskGroup1", content: "뮤지컬", title: "2022 푸에르자부르타웨이라 인 서울 2022", period: "2022-09.29 - 2022.12.26"),
        YesPickModel(yesPickImage: "maskGroup2", content: "뮤지컬", title: "2022 권정의 험난한 합동세미나 과제", period: "2022-09.29 - 2022.12.26"),
        YesPickModel(yesPickImage: "maskGroup3", content: "뮤지컬", title: "뮤지컬 <캣츠> 오리지널 내한-서울 (Musical)", period: "2022-09.29 - 2022.12.26")
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

extension YesPickTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(yesPickCollectionView)
        
        yesPickCollectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        yesPickCollectionView.register(
            YesPickCollectionViewCell.self,
            forCellWithReuseIdentifier: YesPickCollectionViewCell.identifier
        )
        yesPickCollectionView.register(
            YesPickCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: YesPickCollectionReusableView.identifier
        )
    }
}

extension YesPickTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // 여기 하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YesPickCollectionViewCell.identifier, for: indexPath) as? YesPickCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(model: yesPickModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
            withReuseIdentifier: YesPickCollectionReusableView.identifier,
            for: indexPath) as? YesPickCollectionReusableView else { return UICollectionReusableView() }
        return header
    }
    
    func colletionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 120
        return CGSize(width: width, height: height)
    }
}

extension YesPickTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 126, height: 252)
    }
}
