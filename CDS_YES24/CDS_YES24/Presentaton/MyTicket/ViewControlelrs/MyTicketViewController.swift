//
//  MyTicketViewController.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit
import Moya
import SnapKit
import Then

final class MyTicketViewController: UIViewController {
    
    private var user: User?
    
    private var myTicketData: MyTicketResponseDTO?
    
    private let titleLabel: UILabel = UILabel()
    private let myTicketTableView: UITableView = UITableView(frame: .zero, style: .grouped)

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAPIDataBind()
    }
}

extension MyTicketViewController {
    private func setAPIDataBind() {
        MyTicketAPI.shared.myTicket(
            completion: { [weak self] myTicketResponseDTO, error in
                self?.myTicketData = myTicketResponseDTO
                guard let myTicketData = self?.myTicketData else {
                    return
                }
                self?.user = User(name: "김현지",
                                  yesPoint: myTicketData.yesPoint,
                                  saleCoupon: myTicketData.saleCoupon,
                                  advanceTicket: myTicketData.booking)
                
                self?.setUI()
                self?.setLayout()
                self?.setTableView()
            })
        
    }
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
        else if (indexPath.section == 1 ) { return CGFloat(215).adjusted}
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
            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: ProfileMyTicketTableViewCell.className, for: indexPath) as? ProfileMyTicketTableViewCell else {return ProfileMyTicketTableViewCell() }
            cell.selectionStyle = .none
            guard let user = self.user else {
                return UITableViewCell()
            }
            cell.setDataBind(user: user)
            return cell
        case 1:
            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: RecentReserveMyTicketTableViewCell.className, for: indexPath) as? RecentReserveMyTicketTableViewCell else {return RecentReserveMyTicketTableViewCell()}
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = myTicketTableView.dequeueReusableCell(withIdentifier: ConcertMyTicketTableViewCell.className, for: indexPath) as? ConcertMyTicketTableViewCell else {return ConcertMyTicketTableViewCell()}
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = myTicketTableView.dequeueReusableHeaderFooterView(withIdentifier: MyTicketTabelViewHeaderView.className) as? MyTicketTabelViewHeaderView else { return UIView()}
        
        guard let user = self.user else {
            return UIView()
        }
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
