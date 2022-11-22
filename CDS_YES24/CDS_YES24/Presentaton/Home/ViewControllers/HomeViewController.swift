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
            //make.edges.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        ticketHomeTableView.register(ShowGalleryTableViewCell.self,
                                     forCellReuseIdentifier: ShowGalleryTableViewCell.identifier)
        ticketHomeTableView.register(HomeButtonTableViewCell.self,
                                     forCellReuseIdentifier: HomeButtonTableViewCell.identifier)
        ticketHomeTableView.register(YesPickTableViewCell.self,
                                     forCellReuseIdentifier: YesPickTableViewCell.identifier)
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
            return 484.0
        }
        else if (indexPath.section == 1){
            return 247.0
        }
        else if (indexPath.section == 2 || indexPath.section == 3){
            return 395.0
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){ // ShowGallery 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: ShowGalleryTableViewCell.identifier, for: indexPath) as? ShowGalleryTableViewCell else { return ShowGalleryTableViewCell()
            }
            return cell
        }
        else if (indexPath.section == 1){ // HomeButton 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: HomeButtonTableViewCell.identifier, for: indexPath) as? HomeButtonTableViewCell else { return HomeButtonTableViewCell()
            }
            return cell
        }
        else if (indexPath.section == 2){ // YePick 테이블 뷰 셀 반환
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: YesPickTableViewCell.identifier, for: indexPath) as? YesPickTableViewCell else { return YesPickTableViewCell()
            }
            return cell
        }
        else if (indexPath.section == 3){
            guard let cell = ticketHomeTableView.dequeueReusableCell(withIdentifier: YesPickTableViewCell.identifier, for: indexPath) as?
                    YesPickTableViewCell else { return YesPickTableViewCell()
            }
            return cell
        }
        else {
            let cell = UITableViewCell()
            return cell
        }
    }
}

