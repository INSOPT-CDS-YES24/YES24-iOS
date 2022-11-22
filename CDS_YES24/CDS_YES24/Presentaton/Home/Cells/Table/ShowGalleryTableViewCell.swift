//
//  ShowGalleryTableViewCell.swift
//  CDS_YES24
//
//  Created by KJ on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class ShowGalleryTableViewCell: UITableViewCell {
    
    static let identifier = "ShowGalleryTableViewCell"
    
    // showGalleryCollectionView
    private lazy var showGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        // collectionView.isPagingEnabled = true // 화면 꽉 찼을 때 씀
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // 이렇게 노가다 방법밖에 없는걸까..?
    var showGalleryModel: [ShowGalleryModel] = [
        ShowGalleryModel(galleryImage: "homeImgMain", title: "뮤지컬 [삼총사]", period: "2022.09.16 - 2022.11.06", place: "유니버설아트센터 대극장"),
        ShowGalleryModel(galleryImage: "homeImgMain", title: "가나다라", period: "gggg.aa.bb - 1111.22.33", place: "너무 어려워")
    ]
    
    private let homeBackImage = UIImageView().then {
        $0.image = Image.homeBackground
    }
    
    // logo
    private let homeLogo24Ticket = UIImageView().then {
        $0.image = Image.homeLogo
    }
    
    private let userName = UILabel().then {
        $0.text = "김현지님,"
        $0.font = UIFont.pretendard(.bold, size: 22)
        $0.textColor = .white
    }
    
    private let recommendLabel = UILabel().then {
        $0.text = "이런 공연은 어떠세요?"
        $0.font = UIFont.pretendard(.regular, size: 22)
        $0.textColor = .white
    }
    
    private let leftButton = UIButton().then {
        $0.setImage(Image.leftButton, for: .normal)
    }
    
    private let rightButton = UIButton().then {
        $0.setImage(Image.rightButton, for: .normal)
    }
    
    private final let ContainerCellWidth = UIScreen.main.bounds.width
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        register()
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

}

extension ShowGalleryTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(homeBackImage)
        contentView.addSubview(showGalleryCollectionView)
        
        showGalleryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // 나중에 이미지 사이즈 고치기
        homeBackImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        [homeLogo24Ticket, userName, recommendLabel,
         rightButton, leftButton].forEach{
            contentView.addSubview($0)
        }
        
        homeLogo24Ticket.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(124)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(homeLogo24Ticket.snp.bottom).offset(14)
            make.leading.equalTo(homeLogo24Ticket)
        }
        
        recommendLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(5)
            make.leading.equalTo(homeLogo24Ticket)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().offset(320) // 왜 굳이 이렇게 해야하는 거지?
        }
        
        leftButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().offset(30)
        }
    }
    
    private func register() {
        showGalleryCollectionView.register(ShowGalleryCollectionViewCell.self, forCellWithReuseIdentifier: ShowGalleryCollectionViewCell.identifier)
    }
}

// 이게 문제같음
extension ShowGalleryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case showGalleryCollectionView:
            return CGSize(width: ContainerCellWidth, height: 515)
        default:
            return CGSize.zero
        }
    }
}

extension ShowGalleryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowGalleryCollectionViewCell.identifier, for: indexPath) as? ShowGalleryCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(model: showGalleryModel[indexPath.item])
        return cell
    }
}
