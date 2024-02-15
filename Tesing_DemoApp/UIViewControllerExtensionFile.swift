//
//  UIViewControllerExtensionFile.swift
//  DemoApp
//
//  Created by hammoq on 05/02/24.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, completionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler?()
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showConfirmationAlert(title: String?, message: String?, confirmHandler: @escaping () -> Void, cancelHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            confirmHandler()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            cancelHandler?()
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func isValidName(_ name: String?) -> Bool {
        guard let name = name, !name.isEmpty else {
            showAlert(title: "Alert Title", message: "Name field cannot be empty") {}
            return false
        }
        return true
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email, !email.isEmpty else {
            debugPrint("Please enter a valid email")
            showAlert(title: "Alert Title", message: "Email field cannot be empty") {}
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            debugPrint("Please enter a valid email address")
            showAlert(title: "Alert Title", message: "Please enter a valid email address") {}
            return false
        }
        
        return true
    }
    
    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password, !password.isEmpty else {
            showAlert(title: "Alert Title", message: "Password field cannot be empty") {}
            return false
        }
        if password.count < 6 {
            showAlert(title: "Alert Title", message: "Password should be at least 6 characters long") {}
            return false
        }
        
        return true
    }
    
    func isValidConfirmPassword(_ password: String?, confirmPassword: String?) -> Bool {
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty else {
            showAlert(title: "Alert Title", message: "Confirm Password field cannot be empty") {}
            return false
        }
        
        guard let password = password, password == confirmPassword else {
            showAlert(title: "Alert Title", message: "Passwords do not match") {}
            return false
        }
        
        return true
    }
}

