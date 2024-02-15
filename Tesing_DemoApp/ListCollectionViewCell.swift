//
//  ListCollectionViewCell.swift
//  DemoApp
//
//  Created by hammoq on 09/02/24.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                configureAsSelected()
//            } else {
//                setupCell()
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        resetCell()
    }
    
    // MARK: - Selected State
    func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            layer.borderColor = UIColor.red.cgColor
        } else {
            layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    // MARK: - Cell Configuration
    
    private func setupCell() {
        layer.cornerRadius = 4
        layer.masksToBounds = true
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2.0
        layer.cornerCurve = .continuous
    }
    
    private func resetCell() {
        imageView.image = nil
        tagLabel.text = ""
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2.0
    }
    
    // MARK: - Selected Cell Configuration
    
    func configureAsSelected() {
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1.5
    }
}

//class ShadowView: UIView {
//    override var bounds: CGRect {
//        didSet {
//            setupShadow()
//        }
//    }
//    
//    private func setupShadow() {
//        self.layer.cornerRadius = 8
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowRadius = 5
//        self.layer.shadowOpacity = 0.1
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
//    }
//}
