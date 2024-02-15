//
//  AlertViewController.swift
//  DemoApp
//
//  Created by hammoq on 14/02/24.
//

import Foundation
import UIKit

class AlertViewController {
    
    private func initAlertViewController() -> AlertVC {
        let alertvc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "AlertVC") as! AlertVC
        alertvc.setStrings(title: "DemoApp", message: "Please update your list")
        alertvc.modalPresentationStyle = .overCurrentContext
        alertvc.modalTransitionStyle = .crossDissolve
        return alertvc
    }
    
    func showAlert(title: String, message: String, viewController: UIViewController, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertVC = self.initAlertViewController()
            alertVC.setStrings(title: title, message: message, completion: completion)
            viewController.present(alertVC, animated: true)
        }
    }
}
