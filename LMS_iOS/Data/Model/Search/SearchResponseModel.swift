//
//  SearchResponseModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/29.
//

import Foundation

struct SearchResponseModel : Codable {
    let id, gradePoint, stockQuantity: Int
    let name, professor, time: String
}
