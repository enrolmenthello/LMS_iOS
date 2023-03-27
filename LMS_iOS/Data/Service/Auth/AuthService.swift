//
//  AuthService.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/27.
//

import Foundation

private let LOGIN_URL = "/members/login"
private let JOIN_URL = "/members/join"

class AuthService {
    
    func requestLogin(param: LoginRequestModel, completion: @escaping (AuthResponseModel) -> Void) {
        APIManger.shared.postData(urlEndpointString: LOGIN_URL, dataType: AuthResponseModel.self, parameter: param) { response in
            completion(response.result!)
        }
    }
    
    func requestJoin(param: JoinRequestModel, completion: @escaping (AuthResponseModel) -> Void) {
        APIManger.shared.postData(urlEndpointString: JOIN_URL, dataType: AuthResponseModel.self, parameter: param) { response in
            completion(response.result!)
        }
    }
}
