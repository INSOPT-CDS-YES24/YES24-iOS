//
//  ConcertMyTicketTableViewCell.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

class ConcertMyTicketTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    private var images: [UIImage?] = Image.myConcert()
    
    static var isFromNib = false
    
    private lazy var myConcertCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        MyConcertCollectionViewCell.register(target: collectionView)
        return collectionView
    }()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ConcertMyTicketTableViewCell{
    private func setDelegate(){
        myConcertCollectionView.delegate = self
        myConcertCollectionView.dataSource = self
    }
    private func setLayout(){
        contentView.addSubview(myConcertCollectionView)
        myConcertCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(CGFloat(211).adjusted)
        }
    }
}
extension ConcertMyTicketTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myConcertCollectionView.dequeueReusableCell(withReuseIdentifier: MyConcertCollectionViewCell.className, for: indexPath) as? MyConcertCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setDataBind(concertImage: images[indexPath.row]!, genre: "콘서트", title: "NCT 127 2ND")
        return cell
    }
}

extension ConcertMyTicketTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CGFloat(108).adjusted, height: CGFloat(190).adjusted)
        return CGSize(width: CGFloat(108).adjusted, height: CGFloat(200).adjusted)
    }
}
