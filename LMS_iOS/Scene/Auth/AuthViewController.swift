//
//  AuthViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/26.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var loginPwTextField: UITextField!
    
    
    @IBOutlet weak var joinView: UIView!
    
    @IBOutlet weak var joinIdTextField: UITextField!
    @IBOutlet weak var joinNameTextField: UITextField!
    @IBOutlet weak var joinPwTextField: UITextField!
    @IBOutlet weak var joinPwCheckTextField: UITextField!
    
    private let authViewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupNavigationBar()
        setupObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    func setup() {
        loginView.isHidden = false
        joinView.isHidden = true
        
        
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupObserver() {
        authViewModel.getMember { member in
            if member != nil {
                // 메인 화면 이동
            }
        }
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func login(_ sender: Any) {
        let id = loginIdTextField.text!
        let pw = loginPwTextField.text!
        
        authViewModel.login(id: id, pw: pw)
    }
    
    @IBAction func moveToJoin(_ sender: Any) {
        loginView.isHidden = true
        joinView.isHidden = false
    }
    
    
    
    @IBAction func join(_ sender: Any) {
    }
}
