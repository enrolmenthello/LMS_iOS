//
//  HomeViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/28.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setObserver()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setObserver() {
        AuthViewModel.shared.getName { name in
            self.nameTextLabel.text = name + " 님 환영합니다."
        }
    }
    
    @IBAction func moveToSearch(_ sender: Any) {
    }
    
    
    @IBAction func moveToUserInfo(_ sender: Any) {
    }
    
    
    @IBAction func moveToEnrolment(_ sender: Any) {
    }
    
    
    @IBAction func logout(_ sender: Any) {
    }
    
}
