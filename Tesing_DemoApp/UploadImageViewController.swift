//
//  UploadImageViewController.swift
//  DemoApp
//
//  Created by hammoq on 05/02/24.
//

import UIKit
import PhotosUI

class UploadImageViewController: UIViewController {
    
    @IBOutlet weak var imageBGView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var editImageButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = CoreDataHandler.shared.fetchAllUser()
        debugPrint("ALL USERS :", users)
        for user in users {
            debugPrint("UserName: \(user.name)\n userEmail: \(user.email)\n userPassword: \(user.password)")
        }
        prepareUI()
    }
    
    private func prepareUI() {
        self.navigationController?.isNavigationBarHidden = true
        imageBGView.layer.cornerRadius = imageBGView.frame.height/2
        imageView.layer.cornerRadius = imageView.frame.height/2
        uploadImageButton.layer.cornerRadius = uploadImageButton.frame.height/2
        editImageButton.layer.cornerRadius = editImageButton.frame.height/2
    }
    
    @IBAction func uploadImageButtonAction(_ sender: UIButton) {
        debugPrint("UPLOAD BUTTON PRESSED :")
        
    }
    
    @IBAction func editImageButtonAction(_ sender: UIButton) {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func signOutButtonAction(_ sender: UIButton) {
        debugPrint("SignOut Button pressed: ")
        showConfirmationAlert(title: "Alert", message: "Are you sure you want to SignOut?", confirmHandler: {
            UserDefaults.standard.removeObject(forKey: "isLoggedIn")
            let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            self.navigationController?.pushViewController(signInVC, animated: true)
            print("OK button tapped")
        }) {
            print("Cancel button tapped")
        }
    }
}

extension UploadImageViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async { [weak self] in
                            self?.imageView.image = image
//                            self?.selectedImages.append(image)
//                            self?.collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
}
