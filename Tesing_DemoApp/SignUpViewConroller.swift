//
//  ViewController.swift
//  DemoApp
//
//  Created by hammoq on 05/02/24.
//

import UIKit
import CoreData

class SignUpViewConroller: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordVisiblityButton: UIButton!
    @IBOutlet weak var confirmPassVisiblityButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        
    }
    
    private func prepareUI() {
        self.navigationController?.isNavigationBarHidden = true
        nameView.layer.cornerRadius = emailView.frame.height/2
        emailView.layer.cornerRadius = emailView.frame.height/2
        passwordView.layer.cornerRadius = passwordView.frame.height/2
        confirmPasswordView.layer.cornerRadius = confirmPasswordView.frame.height/2
        signUpButton.layer.cornerRadius = signUpButton.frame.height/2
    }
    
    @IBAction func passwordVisibleButtonAction(_ sender: UIButton) {
        passTextField.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func confirmPassVisibleButtonAction(_ sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        debugPrint("Sign UP BUTTON PRESSED :")
        let name = nameTextField.text
        let email = emailTextField.text
        let pass = passTextField.text
        let confirmPass = confirmPasswordTextField.text
        
        guard isValidName(name) && isValidEmail(email) && isValidPassword(pass) && isValidConfirmPassword(pass, confirmPassword: confirmPass) else { return }
        let user = UserModel(name: name, email: email, password: pass)
        showHUD()
        if CoreDataHandler.shared.userExists(user: user) {
            hideHUD()
            showAlert(title: "Alert", message: "User with this email already exists")
        } else {
            hideHUD()
            if CoreDataHandler.shared.registerUser(user) {
                showAlert(title: "Success", message: "User registered successfuly \n please login") {
                    debugPrint("OK Button Pressed!")
                    let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                    self.navigationController?.pushViewController(signInVC, animated: true)
                }
            } else {
                showAlert(title: "Failed", message: "User not registered")
            }
        }
    }
    
    @IBAction func signInbuttonAction(_ sender: UIButton) {
        debugPrint("SIGN IN BUTTON PRESSED :")
        self.navigationController?.popViewController(animated: true)
    }
}

