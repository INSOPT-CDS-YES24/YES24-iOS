//
//  MyTicketViewController.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

final class MyTicketViewController: UIViewController {
    private let user: User = User(name: "김현지", yesPoint: 3127, saleCoupon: 0, advanceTicket: 0)
    private let titleLabel: UILabel = UILabel()
    private let myTicketTableView: UITableView = UITableView(frame: .zero, style: .grouped)

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI() 
        setLayout()
        setTableView()
    }
}

extension MyTicketViewController{
    // MARK: - View 속성 설정
    private func setUI(){
        view.backgroundColor = .white
        titleLabel.do {
            $0.text = Const.String.myTicket
            $0.font = UIFont.pretendard(.bold, size: 18)
        }
        myTicketTableView.do {
            $0.backgroundColor = .white
            $0.register(MyTicketTabelViewHeaderView.self,
                        forHeaderFooterViewReuseIdentifier: MyTicketTabelViewHeaderView.className)
//            $0.register(MyTicketTabelViewHeaderView.self) // 셀등록
            ProfileMyTicketTableViewCell.register(target: $0)
            RecentReserveMyTicketTableViewCell.register(target: $0)
            ConcertMyTicketTableViewCell.register(target: $0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
    }
    
    // MARK: - Layout Helper
    private func setLayout(){
        view.addSubViews(titleLabel, myTicketTableView)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
        }
        myTicketTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(13)
        }
    }
    private func setTableView(){
        myTicketTableView.delegate = self
        myTicketTableView.dataSource = self
    }
}
extension MyTicketViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 ) { return 100 }
        else if (indexPath.section == 1 ) { return CGFloat(300).adjusted }
        else if (indexPath.section == 1 ) { return 215}
        else if (indexPath.section == 2 ) { return 100 }
        else { return 0 }
    }
}
extension MyTicketViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: ProfileMyTicketTableViewCell.className, for: indexPath) as? ProfileMyTicketTableViewCell else {return ProfileMyTicketTableViewCell()}
            cell.setDataBind(user: user)
            return cell
        case 1:
            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: RecentReserveMyTicketTableViewCell.className, for: indexPath) as? RecentReserveMyTicketTableViewCell else {return RecentReserveMyTicketTableViewCell()}
            return cell
////            cell.setDataBind(user: user)
//        case 2:
//            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: RecentReserveMyTicketTableViewCell.className, for: indexPath) as? RecentReserveMyTicketTableViewCell else {return RecentReserveMyTicketTableViewCell()}
//            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = myTicketTableView.dequeueReusableHeaderFooterView(withIdentifier: MyTicketTabelViewHeaderView.className) as? MyTicketTabelViewHeaderView else { return UIView()}

        switch section{
        case 0:
            headerView.setDataBind(headerType: .userProfile, user: user)
        case 1:
            headerView.setDataBind(headerType: .recentReserve, user: user)
        case 2:
            headerView.setDataBind(headerType: .myConcert, user: user)
        default:
            break
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
}




// 이 부분 나중에 합치기
extension Const.String {
    public static let myTicket = "마이티켓"
    public static let recentReservedTicket = "최근 예매내역"
    public static let myConcert = "나의 관람 공연"
    
    public static let yesPoint = "YES포인트"
    public static let saleCoupon = "할인쿠폰"
    public static let advanceTicket = "예매권"
}


extension UILabel{
    func asColor(targetString: String, color: UIColor) {
            let fullText = text ?? ""
            let attributedString = NSMutableAttributedString(string: fullText)
            let range = (fullText as NSString).range(of: targetString)
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            attributedText = attributedString
        }
}


/// Double이나 Int도 마찬가지로 쓰시면 됩니다.

extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 390
        let ratioH: CGFloat = UIScreen.main.bounds.height / 844
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}


//Model 옮기기
struct User{
    var name: String
    var yesPoint: Int
    var saleCoupon: Int
    var advanceTicket: Int
    
}


