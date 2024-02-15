//
//  StartViewController.swift
//  DemoApp
//
//  Created by hammoq on 06/02/24.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoginStatus()
    }
    
    func checkLoginStatus() {
        if let isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool, isLoggedIn {
            let uploadImageVC = self.storyboard?.instantiateViewController(withIdentifier: "UploadImageViewController") as! UploadImageViewController
            self.navigationController?.pushViewController(uploadImageVC, animated: true)
        } else {
            let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            self.navigationController?.pushViewController(signInVC, animated: true)
        }
    }
}
