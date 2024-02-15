//
//  AlertVC.swift
//  DemoApp
//
//  Created by hammoq on 14/02/24.
//

import UIKit

class AlertVC: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!

    public var completion: (() -> Void)? = nil
    private var titleString: String = ""
    private var discString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {
        alertView.layer.cornerRadius = 14.0
        okButton.layer.cornerRadius = 10.0
        titleLabel.text = titleString
        discriptionLabel.text = discString
    }
    
    public func setStrings(title: String, message: String, completion: (() -> Void)? = nil) {
        titleString = title
        discString = message
        self.completion = completion
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: completion)
    }
}
