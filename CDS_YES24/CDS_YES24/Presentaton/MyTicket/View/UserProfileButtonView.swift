//
//  UserProfileButtonView.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

enum UserProfileInfoType{
    case yesPoint
    case saleCoupon
    case advanceTicket
}
class UserProfileButtonView: UIView {
    
    private let userProfileInfoType: UserProfileInfoType
    private var info: Int
    
    private let profileInfoLabel: UILabel = UILabel()
    private let userInfoLabel: UILabel = UILabel()
    
    init(userProfileInfoType: UserProfileInfoType, info: Int){
        self.userProfileInfoType = userProfileInfoType
        self.info = info
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UserProfileButtonView {
    private func setUI() {
        profileInfoLabel.font = .pretendard(.medium, size: 14)
        userInfoLabel.font = .pretendard(.bold, size: 16)
        switch userProfileInfoType {
        case .yesPoint:
            profileInfoLabel.text = Const.String.yesPoint
        case .saleCoupon:
            profileInfoLabel.text = Const.String.saleCoupon
        case .advanceTicket:
            profileInfoLabel.text = Const.String.advanceTicket
        }
    }
    
    private func setLayout() {
        addSubViews(profileInfoLabel, userInfoLabel)
        profileInfoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY)
            make.height.equalTo(25)
        }
        userInfoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY)
            make.height.equalTo(25)
        }
    }
    
    public func setInfoData(_ infoData: Int) {
        userInfoLabel.text = "\(infoData)원"
    }
}
