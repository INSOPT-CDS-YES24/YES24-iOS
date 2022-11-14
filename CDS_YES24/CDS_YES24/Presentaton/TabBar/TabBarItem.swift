//
//  TabBarItem.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
    case home
    case category
    case search
    case myticket
}

extension TabBarItemType {
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .category:
            return "카테고리"
        case .search:
            return "검색"
        case .myticket:
            return "마이티켓"
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return Image.seletedHome
        case .category:
            return Image.seletedCategory
        case .search:
            return Image.selectedSearch
        case .myticket:
            return Image.selectedMyTicket
        }
    }
    
    var unSelectedIcon: UIImage {
        switch self {
        case .home:
            return Image.home
        case .category:
            return Image.category
        case .search:
            return Image.search
        case .myticket:
            return Image.myTicket
        }
    }
    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: unSelectedIcon,
            selectedImage: selectedIcon)
    }
}
