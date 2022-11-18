//
//  RecentReserveMyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

class RecentReserveMyTicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    static var isFromNib = false
    
    private lazy var ticketCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDelegate()
        setUI()
        setLayout()
        

        for i in 0...3 {
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RecentReserveMyTicketTableViewCell{
    
    private func setDelegate(){
        ticketCollectionView.delegate = self
        ticketCollectionView.dataSource = self
    }
    
    private func setUI(){
        ticketCollectionView.do {
            $0.isPagingEnabled = true
            TicketCollectionViewCell.register(target: $0)
        }
    }
    
    private func setLayout(){
        self.contentView.addSubview(ticketCollectionView)
        ticketCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-43)
        }
        
        
    }
}
extension RecentReserveMyTicketTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ticketCollectionView.dequeueReusableCell(withReuseIdentifier: TicketCollectionViewCell.className, for: indexPath) as? TicketCollectionViewCell else { return TicketCollectionViewCell() }
        return cell
    }
}

extension RecentReserveMyTicketTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: contentView.frame.size.width , height: 200)
    }
}
