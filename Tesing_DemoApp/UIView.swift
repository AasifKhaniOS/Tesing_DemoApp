//
//  UIView.swift
//  DemoApp
//
//  Created by hammoq on 08/02/24.
//

//import UIKit
import MBProgressHUD

extension UIViewController {
    func showHUD(_ title: String = "") {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = title
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
