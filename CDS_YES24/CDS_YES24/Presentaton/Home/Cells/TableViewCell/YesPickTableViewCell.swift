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
    
    private let yesPickLogo = UIImageView().then {
        $0.image = Image.yesPick
    }
    
    private let favoriteLabel = UILabel().then {
        $0.text = """
                평소 선호하시는
                뮤지컬 장르의 인기 공연이에요.
                """
        $0.font = UIFont.pretendard(.bold, size: 18)
        $0.textColor = Color.yesBrownishGrey
        $0.numberOfLines = 0
        $0.partColorChange(targetString: "뮤지컬", textColor: UIColor(red: 83/255, green: 141/255, blue: 255/255, alpha: 1))
    }
    
    private let moreLabel = UIImageView().then {
        $0.image = Image.rightButtonBlack
    }
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        register()
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    var yesPickModel: [YesPickModel] = [
        YesPickModel(yesPickImage: "maskGroup1", content: "뮤지컬", title: "2022 푸에르자부르타웨이라 인 서울 2022", period: "2022.09.29 - 2022.12.26"),
        YesPickModel(yesPickImage: "maskGroup2", content: "뮤지컬", title: "2022 권정의 험난한 합동세미나 과제", period: "2022.09.29 - 2022.12.26"),
        YesPickModel(yesPickImage: "maskGroup3", content: "뮤지컬", title: "뮤지컬 <안가은> 오리지널 내한-파리바게트 (Musical)", period: "2022.11.24 - 2022.12.23")
    ]
}

extension YesPickTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [yesPickLogo, favoriteLabel, moreLabel, yesPickCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        yesPickLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.leading.equalToSuperview().offset(20)
        }
        
        favoriteLabel.snp.makeConstraints { make in
            make.top.equalTo(yesPickLogo.snp.bottom).offset(13)
            make.leading.equalTo(yesPickLogo)
        }
        
        moreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.trailing.equalToSuperview().inset(7)
        }
        
        yesPickCollectionView.snp.makeConstraints { make in
            make.top.equalTo(yesPickLogo.snp.bottom).offset(40) // 뭔가 이상
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func register() {
        yesPickCollectionView.register(
            YesPickCollectionViewCell.self,
            forCellWithReuseIdentifier: YesPickCollectionViewCell.identifier
        )
    }
}

extension YesPickTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 126, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return CGFloat(12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
    }
}

extension YesPickTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yesPickModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YesPickCollectionViewCell.identifier, for: indexPath) as? YesPickCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(model: yesPickModel[indexPath.item])
        return cell
    }
}
