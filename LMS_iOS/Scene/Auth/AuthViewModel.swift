//
//  AuthViewModel.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/25.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var member: Member?
    
    func getMember(completion:@escaping (Member) -> Void) {
        completion(member!)
    }
    
    func getId(completion:@escaping (String) -> Void) {
        completion(member!.id)
    }
    
    func getName(completion: @escaping (String) -> Void) {
        completion(member!.name)
    }
    
    func login(id: String, pw: String) {
        
    }
}
