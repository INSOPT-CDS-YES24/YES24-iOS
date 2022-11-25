//
//  MyTicketTabelViewHeaderView.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

enum MyTicketHeaderType{
    case userProfile
    case recentReserve
    case myConcert
}

class MyTicketTabelViewHeaderView: UITableViewHeaderFooterView {
    private var headerType: MyTicketHeaderType?
    private var user: User?
    
    private let headerLabel: UILabel = UILabel()
    private let nextVCButton: UIButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MyTicketTabelViewHeaderView{
    public func setDataBind(headerType: MyTicketHeaderType, user: User){
        self.headerType = headerType
        self.user = user
        setUI()
        setLayout()
    }
    private func setUI(){
        headerLabel.do {
            switch headerType{
            case .userProfile:
                $0.text = "\(user!.name)님 안녕하세요"
                $0.asColor(targetString: user!.name, color: .blue)
                $0.font = .pretendard(.bold, size: 20)
            case .recentReserve:
                $0.text = Const.String.recentReservedTicket
                $0.font = .pretendard(.bold, size: 16)
            case .myConcert:
                $0.text = Const.String.myConcert
                $0.font = .pretendard(.bold, size: 16)
            case .none:
                return
            }
        }
        nextVCButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = Color.yesBrownishGrey
        }
    }
    private func setLayout(){
        addSubViews(headerLabel, nextVCButton)
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        nextVCButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.trailing.equalToSuperview().offset(-7)
            make.centerY.equalToSuperview()
        }
    }
}
