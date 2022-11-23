//
//  DetailViewController.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    // MARK: - UI Components
    private let naviView = NaviView()
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let reserveButton = ReserveButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
        setUI()
    }
}

extension DetailViewController {
    private func setUI() {
        tableView.do {
            $0.rowHeight = UITableView.automaticDimension
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .singleLine
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func register() {
        tableView.delegate = self
        tableView.dataSource = self
        PosterTableViewCell.register(target: tableView)
        InfoTableViewCell.register(target: tableView)
        TicketTableViewCell.register(target: tableView)
        ActorTableViewCell.register(target: tableView)
        DiscountTableViewCell.register(target: tableView)
        ShowInfoTableViewCell.register(target: tableView)
        ShowDetailTableViewCell.register(target: tableView)
        
    }
    
    private func setLayout() {
        view.addSubViews(tableView, naviView, reserveButton)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        naviView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
        }
        
        reserveButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.className, for: indexPath) as? PosterTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.className, for: indexPath) as? InfoTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGRectGetWidth(tableView.bounds));
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TicketTableViewCell.className, for: indexPath) as? TicketTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableViewCell.className, for: indexPath) as? ActorTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableViewCell.className, for: indexPath) as? DiscountTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowDetailTableViewCell.className, for: indexPath) as? ShowDetailTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowInfoTableViewCell.className, for: indexPath) as? ShowInfoTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = (scrollView.contentOffset.y > 150)
    }
}
