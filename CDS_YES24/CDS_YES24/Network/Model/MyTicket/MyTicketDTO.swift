//
//  MyTicketDTO.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/27.
//

import Foundation

// MARK: - MyTicketDTO
struct MyTicketResponseDTO: Codable {
    let id: Int
    let userID: Int
    let yesPoint: Int
    let saleCoupon: Int
    let booking: Int

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case yesPoint, saleCoupon, booking
    }
}

