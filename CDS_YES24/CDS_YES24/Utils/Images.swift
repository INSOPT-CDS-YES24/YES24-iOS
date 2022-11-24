//
//  Image.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

public enum Image {
    // TabBar
    public static let category = UIImage(named: "category")!
    public static let home = UIImage(named: "home")!
    public static let myTicket = UIImage(named: "myTicket")!
    public static let search = UIImage(named: "search")!
    public static let selectedMyTicket = UIImage(named: "selectedMyTicket")!
    public static let selectedSearch = UIImage(named: "selectedSearch")!
    public static let seletedCategory = UIImage(named: "seletedCategory")!
    public static let seletedHome = UIImage(named: "seletedHome")!
    
    // Home
    
    // Detail
    static let heart = UIImage(named: "heart")!
    static let fillHeart = UIImage(named: "fillHeart")!
    static let backButton = UIImage(named: "icHome")!
    static let background = UIImage(named: "background")!
    static let detailButton = UIImage(named: "icRight")!
    static let shareButton = UIImage(named: "icShare")!
    static let loction = UIImage(named: "icLocation")!
    static let calendar = UIImage(named: "icDate")!
    static let actor1 = UIImage(named: "Component 1")!
    static let actor2 = UIImage(named: "Component 2")!
    static let actor3 = UIImage(named: "Component 3")!
    static let actor4 = UIImage(named: "Component 4")!
    static let actor5 = UIImage(named: "Component 5")!
    static let couponDetail = UIImage(named: "couponDetail")!
    static let detailPoster = UIImage(named: "detailPoster")!
    static let expadingButton = UIImage(named: "icBelow")!
    
    // Search
    
    // MyTicket
    public static func ticket()->[UIImage?] {
        return [
            UIImage(named: "ticket1"),
            UIImage(named: "ticket1"),
            UIImage(named: "ticket1"),
            UIImage(named: "ticket1"),
            UIImage(named: "ticket1"),
            UIImage(named: "ticket1")
        ]
    }
    
    public static func myConcert() -> [UIImage?]{
        return [
            UIImage(named: "myConcert1"),
            UIImage(named: "myConcert1"),
            UIImage(named: "myConcert1"),
            UIImage(named: "myConcert1"),
            UIImage(named: "myConcert1"),
        ]
    }
}
