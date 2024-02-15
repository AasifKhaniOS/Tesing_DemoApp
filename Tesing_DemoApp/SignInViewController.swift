//
//  SignInViewController.swift
//  DemoApp
//
//  Created by hammoq on 05/02/24.
//

import UIKit
import CoreData
import MBProgressHUD
//import SVProgressHUD

class SignInViewController: UIViewController {
    
    //MARK: - IBOutlet's
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var appleSignInButton: UIButton!
    @IBOutlet weak var googleSignInButton: UIButton!
    
    //MARK: - Properties

    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    //MARK: - Private methods
    private func prepareUI() {
        self.navigationController?.isNavigationBarHidden = true
        emailView.layer.cornerRadius = emailView.frame.height/2
        passwordView.layer.cornerRadius = passwordView.frame.height/2
        signInButton.layer.cornerRadius = signInButton.frame.height/2
        appleSignInButton.layer.cornerRadius = appleSignInButton.frame.height/2
        googleSignInButton.layer.cornerRadius = googleSignInButton.frame.height/2
    }
    
    //MARK: - Action Methods
    @IBAction func passwordVisibleButtonAction(_ sender: UIButton) {
        passTextField.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: UIButton) {
        debugPrint("ForgotPass BUTTON PRESSED :")
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        let email = emailTextField.text
        let pass = passTextField.text
        if isValidEmail(email) && isValidPassword(pass) {
            let user = UserModel(name: "", email: email!, password: pass!)
            showHUD("Signing...")
            if let user = CoreDataHandler.shared.fetchUser(user: user) {
                print("Login successful for user: \(user.name ?? "Unknown user")")
                UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                hideHUD()
                let uploadImageVC = self.storyboard?.instantiateViewController(withIdentifier: "UploadImageViewController") as! UploadImageViewController
                self.navigationController?.pushViewController(uploadImageVC, animated: true)
            } else {
                hideHUD()
                showAlert(title: "Alert", message: "User not found")
            }
        }
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        debugPrint("Sign UP button preesed BUTTON PRESSED :")
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewConroller") as! SignUpViewConroller
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
