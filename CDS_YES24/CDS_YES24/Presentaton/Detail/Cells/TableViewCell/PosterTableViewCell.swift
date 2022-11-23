//
//  PosterTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/18.
//

import UIKit

class PosterTableViewCell: UITableViewCell, UITableViewRegisterable {
    // MARK: Properties
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    private let posterImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PosterTableViewCell {
    private func setUI() {
        posterImage.image = Image.background
    }
    
    private func setLayout() {
        addSubview(posterImage)
        
        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
