//
//  ProfileMyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit
import Then

class ProfileMyTicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    private var user: User
    static var isFromNib = false
    
    private var yesPointView: UserProfileButtonView = UserProfileButtonView(userProfileInfoType: .yesPoint, info: 0)
    private var saleCouponView: UserProfileButtonView = UserProfileButtonView(userProfileInfoType: .saleCoupon, info: 0)
    private var advanceTicketView: UserProfileButtonView = UserProfileButtonView(userProfileInfoType: .advanceTicket, info: 0)
    
    private let firstLineView: UIView = UIView()
    private let secondLineView: UIView = UIView()
    private let thirdLineView: UIView = UIView()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let defaultUser = User(name: "이름없음", yesPoint: 0, saleCoupon: 0, advanceTicket: 0)
        user = defaultUser
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProfileMyTicketTableViewCell {
    
    public func setDataBind(user: User) {
        self.user = user
        yesPointView.setInfoData(user.yesPoint)
        saleCouponView.setInfoData(user.saleCoupon)
        advanceTicketView.setInfoData(user.advanceTicket)
    }
    private func setLayout(){
        contentView.addSubViews(yesPointView, saleCouponView, advanceTicketView, firstLineView, secondLineView, thirdLineView)
        let infoViewWidth = (contentView.frame.size.width-50) / 3
        [firstLineView, secondLineView, thirdLineView].forEach {
            $0.backgroundColor = Color.yesVeryLightGrey
        }
        yesPointView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(infoViewWidth)
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(30)
        }
        saleCouponView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(yesPointView)
            make.width.equalTo(infoViewWidth)
            make.height.equalTo(yesPointView)
        }
        advanceTicketView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(infoViewWidth)
            make.height.equalTo(yesPointView)
            make.top.equalTo(yesPointView)
        }
        
        firstLineView.snp.makeConstraints { make in
            make.top.bottom.equalTo(yesPointView)
            make.leading.equalToSuperview().inset(50+infoViewWidth)
            make.width.equalTo(1)
        }
        secondLineView.snp.makeConstraints { make in
            make.top.bottom.equalTo(firstLineView)

            make.trailing.equalToSuperview().inset(50+infoViewWidth)
            make.width.equalTo(1)
        }
        thirdLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
