//
//  APIManger.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation
import Alamofire

private let BASE_URL = "http://localhost:8080/"

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
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    
    
    func postData<T: Decodable>(urlEndpointString: String,
                               dataType: T.Type,
                               parameter: Parameters?,
                               completionHandler: @escaping (GeneralResponseModel<T>)->Void) {
        
        guard let url = URL(string: BASE_URL + urlEndpointString) else { return }
        
        AF
            .request(url, method: .post, parameters: parameter, headers: nil)
            .responseDecodable(of: GeneralResponseModel<T>.self) { response in
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
