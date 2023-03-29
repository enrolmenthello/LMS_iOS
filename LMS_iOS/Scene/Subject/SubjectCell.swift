//
//  SubjectCell.swift
//  LMS_iOS
//
//  Created by 유상 on 2023/03/29.
//

import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var professorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var preloadButton: UIButton!
    @IBOutlet weak var enrolmentButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var enerolmentButtonRight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupText(subject: SearchResponseModel) {
        subjectNameLabel.text = "[" + subject.id.description + "] " + subject.name
        professorLabel.text = subject.professor
        timeLabel.text = subject.time
        gradeLabel.text = subject.gradePoint.description
        quantityLabel.text = subject.stockQuantity.description
    }
    
    func showPreloadButton() {
        preloadButton.isHidden = false
    }
    
    func sincheongHidden() {
        enrolmentButton.isHidden = true
    }
    
    func deleteHidden() {
        cancelButton.isHidden = true
        enerolmentButtonRight.constant = -59.0
    }
    
    
    @IBAction func preload(_ sender: Any) {
    }
    
    
    @IBAction func enerolment(_ sender: Any) {
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
    
}
