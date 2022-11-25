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
}

extension ShowService: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .detail:
            return URLConstant.detail
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .detail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .detail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.noTokenHeader
    }
}
