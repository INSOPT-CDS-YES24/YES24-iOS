//
//  DetailAPI.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/25.
//

import Foundation
import Moya

final class DetailAPI {
    static let shared: DetailAPI = DetailAPI()
    private let detailProvider = MoyaProvider<ShowService>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    public private(set) var detailResponse: GeneralResponse<DetailResponseDTO>?
    
    func detail(completion: @escaping ((DetailResponseDTO?, Error?) -> ())) {
        detailProvider.request(.detail) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.detailResponse = try
                    result.map(GeneralResponse<DetailResponseDTO>.self)
                    guard let detailData = self?.detailResponse?.data else {
                        completion(nil, Error.self as? Error)
                        print("🍏")
                        return
                    }
                    print(detailData, "🥺")
                    completion(detailData, nil)
                } catch(let err) {
                    print(err, "📌")
                    print(err.localizedDescription)
                    completion(nil, err)
                }
            case .failure(let err):
                print("❗️")
                print(err.localizedDescription)
                completion(nil, err)
            }
        }
    }
    
}
