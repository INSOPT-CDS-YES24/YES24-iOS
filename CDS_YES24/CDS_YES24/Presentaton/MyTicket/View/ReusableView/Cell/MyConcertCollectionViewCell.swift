//
//  MyConcertCollectionViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

class MyConcertCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {

    static var isFromNib: Bool = true
    
    private let ticketImageView: UIImageView = UIImageView()
    private let genreButton: UIButton = UIButton()
    private let concertTitleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MyConcertCollectionViewCell {
    public func setDataBind(concertImage: UIImage, genre: String, title: String) {
        ticketImageView.image = concertImage
        genreButton.setTitle(genre, for: .normal)
        concertTitleLabel.text = title
    }
    
    private func setUI() {
        ticketImageView.contentMode = .scaleAspectFit
        ticketImageView.layer.cornerRadius = 5
        genreButton.titleLabel?.font = .pretendard(.medium, size: 12)
        concertTitleLabel.font = .pretendard(.medium, size: 14)
        concertTitleLabel.numberOfLines = 0
    }
    private func setLayout() {
        [ticketImageView, genreButton, concertTitleLabel].forEach {
            contentView.addSubview($0)
        }
        ticketImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(CGFloat(139).adjusted)
        }
        genreButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(ticketImageView.snp.bottom).offset(12)
            make.height.equalTo(12)
        }
        concertTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(genreButton.snp.bottom)
        }
    }
}
