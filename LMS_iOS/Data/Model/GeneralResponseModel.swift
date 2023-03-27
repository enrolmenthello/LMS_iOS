//
//  GeneralModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation


struct GeneralResponseModel<T: Codable>: Codable {
    let code: Int?
    let httpStatus, message: String?
    let result: T?
}


struct GeneralResponseArrayModel<T: Codable>: Codable {
    let code: Int
    let httpStatus, message: String
    let result: [T]?
}
