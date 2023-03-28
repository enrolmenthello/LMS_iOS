//
//  JoinViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/27.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationItem.title = "회원가입"
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backToScene))
        backButton.tintColor = .black
    }
    
    @objc func backToScene() {
        self.navigationController?.popViewController(animated: true)
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
    
    @IBAction func join(_ sender: Any) {
        let id = idTextField.text ?? ""
        let pw = pwTextField.text ?? ""
        let pwCheck = pwCheckTextField.text ?? ""
        let name = nameTextField.text ?? ""
        
        if id == "" || pw == "" || pwCheck == "" || name == "" {
            showAlert(title: "회원가입 오류", message: "회원가입 하기 위해 입력창을 모두 입력해주세요.")
            return
        }
        
        if checkPassword() {
            AuthViewModel.shared.join(id: id, pw: pw, name: name)
        }else {
            showAlert(title: "비밀번호 불일치", message: "비밀번호와 비밀번호 재확인이 일치하지 않습니다.")
            return
        }
        
    }
    
    private func checkPassword() -> Bool {
        let pw = pwTextField.text
        let checkPw = pwCheckTextField.text
        if pw == checkPw {
            return true
        }else{
            return false
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    

}
