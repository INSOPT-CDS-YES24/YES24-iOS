//
//  TabBarControlelr.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    // MARK: Properties
    private var tabs: [UIViewController] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
        setTabBarUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 80
        tabBar.frame.origin.y = view.frame.height - 80
    }
}

extension TabBarController {
    private func setTabBarItems() {
        tabs = [
            HomeViewController(),
                DetailViewController(),
                SearchViewController(),
                MyTicketViewController()
        ]
        
        TabBarItemType.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.setTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarUI() {
        UITabBar.clearShadow()
        tabBar.layer.cornerRadius = 5
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.07
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        tabBar.layer.shadowRadius = 36.0 / UIScreen.main.scale
        let fontAttributes = [
            NSAttributedString.Key.font: UIFont.pretendard(.bold, size: 11.0)
            ]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
