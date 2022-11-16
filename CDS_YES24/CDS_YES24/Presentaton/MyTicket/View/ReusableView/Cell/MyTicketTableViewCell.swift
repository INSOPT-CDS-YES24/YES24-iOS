//
//  MyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

//class MyTicketTableViewCell: UITableViewCell, UITableViewRegisterable{
//    static var isFromNib = false
//    
//    // MARK: - Initialize
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}



//이 부분 합치기
protocol UITableViewRegisterable {
     static var isFromNib: Bool { get }
     static func register(target: UITableView)
 }

 extension UITableViewRegisterable where Self: UITableViewCell {
     static func register(target: UITableView) {
         if self.isFromNib {
             target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
         } else {
             target.register(Self.self, forCellReuseIdentifier: Self.className)
         }
     }
 }

extension NSObject {
     static var className: String {
         NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
     }
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
 }
