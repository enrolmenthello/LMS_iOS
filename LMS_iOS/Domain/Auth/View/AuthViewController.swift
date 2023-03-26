//
//  AuthViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/23.
//

import UIKit
import Combine

class AuthViewController: UIViewController {

    @IBOutlet weak var joinView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    @IBOutlet weak var joinIdTextField: UITextField!
    @IBOutlet weak var joinPwTextField: UITextField!
    
    @IBOutlet weak var joinPwCheckTextField: UITextField!
    
    @IBOutlet weak var joinNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        loginView.isHidden = false
        joinView.isHidden = true
    }
    
    
    
    @IBAction func login(_ sender: Any) {
        
    }
    
    
    @IBAction func moveToJoin(_ sender: Any) {
        loginView.isHidden = true
        joinView.isHidden = false
    }
    
    
}
