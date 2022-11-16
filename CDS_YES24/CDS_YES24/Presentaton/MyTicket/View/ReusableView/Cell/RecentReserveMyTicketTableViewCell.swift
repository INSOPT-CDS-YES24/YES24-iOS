//
//  RecentReserveMyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

class RecentReserveMyTicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    static var isFromNib = false
    
    private let ticketScrollView: UIScrollView = UIScrollView()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RecentReserveMyTicketTableViewCell{
    
}
