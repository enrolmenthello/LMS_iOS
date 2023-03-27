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
        let id = idTextField.text!
        let pw = pwTextField.text!
        let pwCheck = pwCheckTextField.text!
        let name = nameTextField.text!
        
        if pw == pwCheck {
            AuthViewModel.shared.join(id: id, pw: pw, name: name)
        }
        
    }
    
    

}
