//
//  SearchService.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/29.
//

import Foundation

private let SEARCH_URL = "/subjects/search"
private let SEARCHALL_URL = "/subjects/alllist"


class SearchService {
    func search(param: SearchRequestModel, completion: @escaping (SearchResponseModel?) -> Void) {
        APIManger.shared.getData(urlEndpointString: SEARCH_URL,responseDataType: GeneralResponseModel<SearchResponseModel>.self, requestDataType: SearchRequestModel.self, parameter: param) { response in
            completion(response.result)
        }
    }
    
    func searchAll(completion: @escaping ([SearchResponseModel]?) -> Void) {
        APIManger.shared.getData(urlEndpointString: SEARCHALL_URL, responseDataType: GeneralResponseArrayModel<SearchResponseModel>.self, requestDataType: SearchRequestModel.self, parameter: nil) { response in
            completion(response.result)
        }
    }
}
