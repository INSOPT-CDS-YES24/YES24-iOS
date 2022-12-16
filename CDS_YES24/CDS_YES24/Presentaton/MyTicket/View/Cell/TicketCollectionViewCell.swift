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
    private let ticketInfoView: TicketInfoView = TicketInfoView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TicketCollectionViewCell{
    public func setDataBind(ticketImage: UIImage?, concertTitle: String, reserveID: String,
                            reservedDate: String, concertDate: String,
                            concertPlace: String, seatNum: String){
        
        ticketImageView.image = ticketImage
        ticketInfoView.setDataBind(concertTitle: concertTitle,
                                   reserveID: reserveID,
                                   reservedDate: reservedDate,
                                   concertDate: concertDate,
                                   concertPlace: concertPlace,
                                   seatNum: seatNum)
    }
    private func setUI(){
        ticketImageView.layer.cornerRadius = 5
        ticketImageView.clipsToBounds = true
        ticketInfoView.layer.cornerRadius = 5
        ticketInfoView.clipsToBounds = true
        contentView.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.1)
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    private func setLayout(){
        self.contentView.addSubViews(ticketImageView, ticketInfoView)
        ticketImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat(16).adjusted)
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



