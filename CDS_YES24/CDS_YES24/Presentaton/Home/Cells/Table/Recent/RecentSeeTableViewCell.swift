//
//  RecentSeeTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/22.
//

import UIKit

class RecentSeeTableViewCell: UITableViewCell {
    
    static let identifier = "RecentSeeTableViewCell"
    
    private let favoriteLabel = UILabel().then {
        $0.text = """
                최근 관람했던
                <에곤실레>와 비슷한 공연이에요.
                """
        $0.font = UIFont.pretendard(.bold, size: 18)
        $0.textColor = Color.yesBrownishGrey
        $0.numberOfLines = 0
    }
    
    private let moreLabel = UIImageView().then {
        $0.image = Image.rightButtonBlack
    }
    
    // yesPickCollectionView
    private lazy var recentSeeCollectionView: UICollectionView = {
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
        YesPickModel(yesPickImage: "maskGroup3", content: "뮤지컬", title: "뮤지컬 <캣츠> 오리지널 내한-서울 (Musical)", period: "2022.09.29 - 2022.12.26")
    ]
}

extension RecentSeeTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [favoriteLabel, moreLabel].forEach {
            contentView.addSubview($0)
        }
        contentView.addSubview(recentSeeCollectionView)
        
        favoriteLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(62)
            make.leading.equalToSuperview().offset(20)
        }
        
        moreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(7)
        }
        
        recentSeeCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(280)
            make.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        recentSeeCollectionView.register(
            YesPickCollectionViewCell.self,
            forCellWithReuseIdentifier: YesPickCollectionViewCell.identifier
        )
    }
}

extension RecentSeeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 126, height: 232)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return CGFloat(12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
    }
}

extension RecentSeeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yesPickModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YesPickCollectionViewCell.identifier, for: indexPath) as? YesPickCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(model: yesPickModel[indexPath.item])
        return cell
    }
}
