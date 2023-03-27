//
//  AuthViewModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var member: AuthResponseModel?
    private var cancelLabels: Set<AnyCancellable> = []
    
    private let authService = AuthService()
    
    func getMember(completion: @escaping (AuthResponseModel) -> Void) {
        $member.sink { member in
            if member != nil {
                completion(member!)
            }
        }.store(in: &cancelLabels)
    }
    
    func getName(completion: @escaping (String) -> Void) {
        $member.sink { member in
            if member != nil {
                completion(member!.name)
            }
        }.store(in: &cancelLabels)
    }
    
    func login(id: String, pw: String) {
        let param = LoginRequestModel(id: id, password: pw)
        authService.requestLogin(param: param) { member in
            self.member = member
        }
    }
    
    func join(id: String, pw: String, name: String) {
        
    }
    
}
