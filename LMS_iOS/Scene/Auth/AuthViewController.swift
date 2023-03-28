//
//  AuthViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/26.
//

import UIKit

class AuthViewController: UIViewController {
    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupObserver() {
        AuthViewModel.shared.getMember { member in
            if member != nil {
                guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
                
                homeVC.modalTransitionStyle = .coverVertical
                homeVC.modalPresentationStyle = .fullScreen
                
                self.navigationController?.pushViewController(homeVC, animated: true)
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
        let id = idTextField.text ?? ""
        let pw = pwTextField.text ?? ""
        
        if id == "" || pw == "" {
            showAlert(title: "로그인 오류", message: "로그인 하기 위해 입력창을 모두 입력해주세요.")
            return
        }
        
        AuthViewModel.shared.login(id: id, pw: pw)
    }
    
    @IBAction func moveToJoin(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController") as? JoinViewController else {return}
        
        joinVC.modalTransitionStyle = .coverVertical
        joinVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
    
}
