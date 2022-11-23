//
//  ActorTableViewCell.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/21.
//

import UIKit

import Then
import SnapKit

class ActorTableViewCell: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = false
    
    private let actorLabel = UILabel()
    private let actorCountLabel = UILabel()
    private lazy var actorCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private let actorDetailButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
        register()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActorTableViewCell {
    private func register() {
        actorCollectionView.dataSource = self
        ActorCollectionViewCell.register(target: actorCollectionView)
    }
    
    private func setUI() {
        actorDetailButton.setImage(Image.detailButton, for: .normal)
        
        actorLabel.do {
            $0.text = "출연진"
            $0.textColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1.0)
            $0.font = .pretendard(.bold, size: 14)
        }
        
        actorCountLabel.do {
            $0.text = "15"
            $0.textColor = Color.yesMain
            $0.font = .pretendard(.bold, size: 14)
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(actorLabel, actorCountLabel, actorCollectionView, actorDetailButton)
        
        actorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        actorCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(actorLabel.snp.centerY)
            $0.leading.equalTo(actorLabel.snp.trailing).offset(9)
        }
        
        actorDetailButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(5)
            $0.size.equalTo(40)
        }
        
        actorCollectionView.snp.makeConstraints {
            $0.top.equalTo(actorLabel.snp.bottom).offset(9)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(85)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(60),
            heightDimension: .absolute(85))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: nil,
            top: nil,
            trailing: .fixed(16),
            bottom: nil)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.1),
            heightDimension: .absolute(85))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension ActorTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actorModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.className, for: indexPath) as? ActorCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(actorModel[indexPath.row])
        return cell
    }
}
