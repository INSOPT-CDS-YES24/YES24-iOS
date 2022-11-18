//
//  TicketCollectionViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/18.
//

import UIKit

class TicketCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable{
    
    static var isFromNib = false
    
    private let ticketImageView: UIImageView = UIImageView()
    private let ticketInfoView: UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TicketCollectionViewCell{
    private func setUI(){
        ticketImageView.do {
            $0.backgroundColor = .red
            $0.layer.cornerRadius = 20
        }
        ticketInfoView.do {
            $0.backgroundColor = .blue
        }
    }
    private func setLayout(){
        self.contentView.addSubViews(ticketImageView, ticketInfoView)
        ticketImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(CGFloat(116).adjusted)
            make.height.equalTo(CGFloat(167).adjusted)
        }
        ticketInfoView.snp.makeConstraints { make in
            make.leading.equalTo(ticketImageView.snp.trailing)
            make.top.bottom.equalTo(ticketImageView)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}




extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}



