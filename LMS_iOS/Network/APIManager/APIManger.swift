//
//  APIManger.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation
import Alamofire

private let BASE_URL = "http://localhost:8080"

class APIManger {
    static let shared = APIManger()
    
    func getData<T: Decodable>(urlEndpointString: String,
                               dataType: T.Type,
                               parameter: Parameters?,
                               completionHandler: @escaping (T)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .get, parameters: parameter, headers: nil)
            .responseDecodable(of: T.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    
    
    func postData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            dataType: U.Type,
                                            parameter: T?,
                               completionHandler: @escaping (GeneralResponseModel<U>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .post, parameters: parameter, encoder: .json, headers: nil)
            .responseDecodable(of: GeneralResponseModel<U>.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
