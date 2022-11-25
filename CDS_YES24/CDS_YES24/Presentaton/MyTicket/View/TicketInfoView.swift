//
//  TicketInfoView.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

class TicketInfoView: UIView {

    private let concertTitleLabel: UILabel = UILabel()
    
    private let reserveIDLabel: UILabel = UILabel()
    private let reserveDateLabel: UILabel = UILabel()
    private let concertDateLabel: UILabel = UILabel()
    private let concertPlaceLabel: UILabel = UILabel()
    private let seatLabel: UILabel = UILabel()
    
    private let reserveIDValueLabel: UILabel = UILabel()
    private let reserveDateValueLabel: UILabel = UILabel()
    private let concertDateValueLabel: UILabel = UILabel()
    private let concertPlaceValueLabel: UILabel = UILabel()
    private let seatValueLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TicketInfoView {
    public func setDataBind(concertTitle: String, reserveID: String,
                            reservedDate: String, concertDate: String,
                            concertPlace: String, seatNum: String){
        concertTitleLabel.text = concertTitle
        reserveIDValueLabel.text = reserveID
        reserveDateValueLabel.text = reservedDate
        concertDateValueLabel.text = concertDate
        concertPlaceValueLabel.text = concertPlace
        seatValueLabel.text = seatNum
    }
    private func setUI(){
        backgroundColor = .white
        reserveIDLabel.text = "예매번호"
        reserveDateLabel.text = "예매일"
        concertDateLabel.text = "관람일"
        concertPlaceLabel.text = "장소"
        seatLabel.text = "좌석"
        concertTitleLabel.font = .pretendard(.bold, size: 14)
        [reserveIDLabel, reserveDateLabel, concertDateLabel, concertPlaceLabel, seatLabel].forEach {
            $0.font = .pretendard(.regular, size: 12)
        }
        [reserveIDValueLabel, reserveDateValueLabel, concertDateValueLabel, concertPlaceValueLabel, seatValueLabel].forEach {
            $0.font = .pretendard(.medium, size: 12)
        }
    }
    
    private func setLayout(){
        [concertTitleLabel, reserveIDLabel, reserveDateLabel, concertDateLabel, concertPlaceLabel, seatLabel].forEach {
            addSubview($0)
        }
        [reserveIDValueLabel, reserveDateValueLabel, concertDateValueLabel, concertPlaceValueLabel, seatValueLabel].forEach {
            addSubview($0)
        }
        concertTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.leading.equalToSuperview().offset(21)
        }
        
        reserveIDLabel.snp.makeConstraints { make in
            make.top.equalTo(concertTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(concertTitleLabel)
        }
        reserveIDValueLabel.snp.makeConstraints { make in
            make.top.equalTo(reserveIDLabel)
            make.leading.equalTo(reserveIDLabel.snp.trailing).offset(12)
        }
        
        reserveDateLabel.snp.makeConstraints { make in
            make.top.equalTo(reserveIDLabel.snp.bottom)
            make.leading.equalTo(concertTitleLabel)
        }
        reserveDateValueLabel.snp.makeConstraints { make in
            make.top.equalTo(reserveDateLabel)
            make.leading.equalTo(reserveIDValueLabel)
        }
        
        concertDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(concertTitleLabel)
            make.top.equalTo(reserveDateLabel.snp.bottom)
        }
        concertDateValueLabel.snp.makeConstraints { make in
            make.top.equalTo(concertDateLabel)
            make.leading.equalTo(reserveIDValueLabel)
        }
        
        concertPlaceLabel.snp.makeConstraints { make in
            make.leading.equalTo(concertTitleLabel)
            make.top.equalTo(concertDateLabel.snp.bottom)
        }
        concertPlaceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(concertPlaceLabel)
            make.leading.equalTo(reserveIDValueLabel)
        }
        seatLabel.snp.makeConstraints { make in
            make.leading.equalTo(concertTitleLabel)
            make.top.equalTo(concertPlaceLabel.snp.bottom)
        }
        seatValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(reserveIDValueLabel)
            make.top.equalTo(seatLabel)
        }
    }
}
