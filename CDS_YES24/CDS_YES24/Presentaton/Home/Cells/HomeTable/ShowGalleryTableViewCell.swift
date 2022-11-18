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
        collectionView.backgroundColor = .systemGray
        return collectionView
    }()
    
    // logo
    static let homeLogo24Ticket = UIImageView().then {
        $0.image = Image.homeLogo
    }
    
    static let userName = UILabel().then {
        $0.text = "김현지님,"
        $0.font = UIFont.pretendard(.bold, size: 22)
        $0.textColor = .white
    }
    
    static let recommendLabel = UILabel().then {
        $0.text = "이런 공연은 어떠세요?"
        $0.font = UIFont.pretendard(.regular, size: 22)
        $0.textColor = .white
    }
    
    static let leftButton = UIButton().then {
        $0.setImage(Image.leftButton, for: .normal)
    }
    
    static let rightButton = UIButton().then {
        $0.setImage(Image.rightButton, for: .normal)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

}

extension ShowGalleryTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.addSubview(showGalleryCollectionView)
        [ShowGalleryTableViewCell.homeLogo24Ticket, ShowGalleryTableViewCell.userName,
         ShowGalleryTableViewCell.recommendLabel, ShowGalleryTableViewCell.rightButton, ShowGalleryTableViewCell.leftButton].forEach{
            showGalleryCollectionView.addSubview($0)
        }
        
        showGalleryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        ShowGalleryTableViewCell.homeLogo24Ticket.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(124)
        }
        
        ShowGalleryTableViewCell.userName.snp.makeConstraints { make in
            make.top.equalTo(ShowGalleryTableViewCell.homeLogo24Ticket.snp.bottom).offset(14)
            make.leading.equalTo(ShowGalleryTableViewCell.homeLogo24Ticket)
        }
        
        ShowGalleryTableViewCell.recommendLabel.snp.makeConstraints { make in
            make.top.equalTo(ShowGalleryTableViewCell.userName.snp.bottom).offset(5)
            make.leading.equalTo(ShowGalleryTableViewCell.homeLogo24Ticket) 
        }
        
        ShowGalleryTableViewCell.rightButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().offset(320)
        }
        
        ShowGalleryTableViewCell.leftButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().offset(30)
        }
    }
}
