//
//  Encodable+.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/24.
//

import Foundation

// MARK: - Encodable Extension
extension Encodable {

  func asParameter() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            as? [String: Any] else {
      throw NSError()
    }

    return dictionary
  }
}
