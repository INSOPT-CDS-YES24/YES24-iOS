//
//  Environment.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/24.
//

import Foundation

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
