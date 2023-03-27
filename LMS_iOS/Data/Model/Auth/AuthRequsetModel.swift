//
//  AuthModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation



struct LoginRequestModel: Codable {
    let id, password: String
}

struct JoinRequestModel: Codable {
    let id, name, password: String
}


