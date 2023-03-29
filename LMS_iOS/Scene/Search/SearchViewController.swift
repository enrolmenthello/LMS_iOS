//
//  SearchViewController.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/29.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupNavigationBar()
    }
    
    func setup() {
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        let cell = UINib(nibName: "SubjectCell", bundle: nil)
        searchResultTableView.register(cell, forCellReuseIdentifier: "SubjectCell")
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func searchAll() {
        SearchViewModel.shared.searchAll()
    }
    
    @IBAction func search(_ sender: Any) {
        let searchText = searchTextField.text ?? ""
        
        if searchText == "" {
            showAlert(title: "검색 오류", message: "검색어를 입력해주세요.")
            return
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchViewModel.shared.getSearchResultsCount()-1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subjectCell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        
        subjectCell.deleteHidden()
        
        SearchViewModel.shared.getSearchResult(index: indexPath.row) { result in
            subjectCell.setupText(subject: result!)
        }
        
        return subjectCell
    }
    
    
}
