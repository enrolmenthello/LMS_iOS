//
//  SearchViewModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/29.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchResults: [SearchResponseModel]? = []
    private var cancelLabels: Set<AnyCancellable> = []
    
    static let shared = SearchViewModel()
    
    private let searchService = SearchService()
    
    func getSearchResults(completion: @escaping ([SearchResponseModel]?) -> Void) {
        $searchResults.sink { searchResults in
            completion(searchResults)
        }.store(in: &cancelLabels)
    }
    
    func getSearchResult(index: Int, completion: @escaping (SearchResponseModel?) -> Void) {
        $searchResults.sink { searchResults in
            completion(searchResults?[index])
        }.store(in: &cancelLabels)
    }
    
    func getSearchResultsCount() -> Int {
        var count = 0
        $searchResults.sink { searchResults in
            count = searchResults!.count
        }.store(in: &cancelLabels)
        return count
    }
    
    
    func search(id: Int) {
        let param = SearchRequestModel(subjectId: id)
        searchService.search(param: param) { result in
            self.searchResults?.removeAll()
            if result != nil {
                self.searchResults?.append(result!)
            }
        }
    }
    
    func searchAll() {
        searchService.searchAll { results in
            self.searchResults?.removeAll()
            if results != nil {
                self.searchResults = results
            }
        }
    }
}
