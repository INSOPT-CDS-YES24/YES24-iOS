//
//  MyTicketAPI.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/27.
//

import Foundation
import Moya

final class MyTicketAPI {
    static let shared: MyTicketAPI = MyTicketAPI()
    
    private let myTicketProvider = MoyaProvider<ShowService>(plugins:[NetworkLoggerPlugin()])
    
    init(){}
    
    public private(set) var myTicketResponse: GeneralResponse<MyTicketResponseDTO>?
    
    func myTicket(completion: @escaping (MyTicketResponseDTO?, Error?)->() ){
        myTicketProvider.request(.myTicket) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    let status = result.statusCode
                    if status >= 200 && status<300 {
                        self?.myTicketResponse = try result.map(GeneralResponse<MyTicketResponseDTO>.self)
                        
                        guard let myTicketResponse = self?.myTicketResponse?.data else {
                            completion(nil, Error.self as? Error)
                            return
                        }
                        print(myTicketResponse)
                        completion(myTicketResponse, nil)
                    }
                    else if status >= 400{
                        completion(nil, Error.self as? Error)
                        print(Const.String.wrongRequest)
                        return
                    }
                } catch (let error) {
                    print("Error!")
                    print(error.localizedDescription)
                    completion(nil, error)
                    
                }
            case .failure(let error):
                print(error.errorDescription)
                completion(nil, error)
            }
        }
    }
}
