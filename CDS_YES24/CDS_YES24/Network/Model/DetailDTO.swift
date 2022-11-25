//
//  DetailModel.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import Foundation

struct DetailDTO {
    let id: Int
    let title: String
    let genre: String
    let dueDate: String
    let location: String
    let actor: ActorList
    let coupon: Int
    let vipSeat: Int
    let rSeat: Int
    let sSeat: Int
    let aSeat: Int
    let host: String
    let callCenter: String
    let ageLimit: String
}

struct ActorList {
    let actorName: String
}
