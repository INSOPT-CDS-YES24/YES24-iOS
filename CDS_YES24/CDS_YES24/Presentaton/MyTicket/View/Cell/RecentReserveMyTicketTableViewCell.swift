//
//  RecentReserveMyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

class RecentReserveMyTicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    private let images: [UIImage?] = Image.ticket()
    
    static var isFromNib = false
    
    private lazy var ticketCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        
    }
}
extension RecentReserveMyTicketTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ticketCollectionView.dequeueReusableCell(withReuseIdentifier: TicketCollectionViewCell.className, for: indexPath) as? TicketCollectionViewCell else { return TicketCollectionViewCell() }
        cell.setDataBind(ticketImage: images[indexPath.row],
                         concertTitle: "검정치마 클럽 공연",
                         reserveID: "Y9982491677",
                         reservedDate: "2022.11.08",
                         concertDate: "2022.11.12.토 19시 00분",
                         concertPlace: "예술의전당 CJ 토월극장",
                         seatNum: "1층 B블록 9열 015번")
        return cell
    }
}

extension RecentReserveMyTicketTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: contentView.frame.size.width , height: CGFloat(167).adjusted)
    }
}
