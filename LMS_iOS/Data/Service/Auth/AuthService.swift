//
//  AuthService.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/27.
//

import Foundation

class AuthService {
    
    func requestLogin(param: LoginRequestModel, completion: @escaping (AuthResponseModel) -> Void) {
        APIManger.shared.postData(urlEndpointString: "/members/login", dataType: AuthResponseModel.self, parameter: param) { response in
            completion(response.result!)
        }
    }
}
