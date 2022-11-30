//
//  ShowService.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/25.
//

import Foundation
import Moya

enum ShowService {
    case detail
    case myTicket
}

extension ShowService: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .detail:
            return URLConstant.detail
        case .myTicket:
            return URLConstant.myTicket
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .detail:
            return .get
        case .myTicket:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .detail:
            return .requestPlain
        case .myTicket:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.noTokenHeader
    }
}
