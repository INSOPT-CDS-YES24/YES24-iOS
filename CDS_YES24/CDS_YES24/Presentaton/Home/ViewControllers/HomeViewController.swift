//
//  ViewController.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

final class HomeViewController: UIViewController {
    
    // ticketHomeTableView
    private var ticketHomeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
        ticketHomeTableView.delegate = self
        ticketHomeTableView.dataSource = self
    }
}

extension HomeViewController {
    private func layout(){
        view.backgroundColor = .white
        view.addSubview(ticketHomeTableView)
        
        ticketHomeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        
        ticketHomeTableView.do {
            $0.rowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.bounces = false
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func register() {
        ticketHomeTableView.register(ShowGalleryTableViewCell.self,
                                     forCellReuseIdentifier: ShowGalleryTableViewCell.identifier)
        ticketHomeTableView.register(HomeButtonTableViewCell.self,
                                     forCellReuseIdentifier: HomeButtonTableViewCell.identifier)
        ticketHomeTableView.register(YesPickTableViewCell.self,
                                     forCellReuseIdentifier: YesPickTableViewCell.identifier)
        ticketHomeTableView.register(RecentSeeTableViewCell.self, forCellReuseIdentifier: RecentSeeTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 515
        }
        else if (indexPath.section == 1){
            return 245
        }
        else if (indexPath.section == 2){
            return 400
        }
        else if (indexPath.section == 3){
            return 470
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){ // ShowGallery 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: ShowGalleryTableViewCell.identifier, for: indexPath) as? ShowGalleryTableViewCell else { return ShowGalleryTableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if (indexPath.section == 1){ // HomeButton 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: HomeButtonTableViewCell.identifier, for: indexPath) as? HomeButtonTableViewCell else { return HomeButtonTableViewCell()
            }
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGRectGetWidth(tableView.bounds))
            return cell
        }
        else if (indexPath.section == 2){ // YesPick 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: YesPickTableViewCell.identifier, for: indexPath) as? YesPickTableViewCell else { return YesPickTableViewCell()
            }
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGRectGetWidth(tableView.bounds))
            return cell
        }
        else if (indexPath.section == 3){
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: RecentSeeTableViewCell.identifier, for: indexPath) as?
                    RecentSeeTableViewCell else { return RecentSeeTableViewCell()
            }
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGRectGetWidth(tableView.bounds))
            return cell
        }
        else {
            let cell = UITableViewCell()
            return cell
        }
    }
}

extension UILabel {
    func partColorChange(targetString: String, textColor: UIColor) {
            let fullText = self.text ?? ""
            let range = (fullText as NSString).range(of: targetString)
            let attributedString = NSMutableAttributedString(string: fullText)
            attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
            self.attributedText = attributedString
        }
}
