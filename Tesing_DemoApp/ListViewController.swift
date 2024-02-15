//
//  ListViewController.swift
//  DemoApp
//
//  Created by hammoq on 09/02/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var bgPreview: UIView!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var skuIdLble: UILabel!
    @IBOutlet weak var statusLble: UILabel!
    
    let alert = AlertViewController()
    let images = ["images","demo_img1", "images","demo_img1","images","demo_img1","images","demo_img1", "images","demo_img1","images","demo_img1"]
    let numberArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        prepareUI()
    }
    
    func prepareUI() {
        bgPreview.layer.cornerRadius = 10
        bgPreview.layer.masksToBounds = true
        listCollectionView.backgroundColor = .clear
        skuIdLble.text = "SKU: 1234\(567)"
        statusLble.text = "Status: Processing"
    }
    
    public func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        listCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func updateImage(index: Int = 0) {
        imagePreview.image = UIImage(named: images[index])
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberArr.count
//        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let img = images[indexPath.row]
        cell.imageView.image = UIImage(named: img)
        cell.tagLabel.text = numberArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPAth = indexPath.item
        debugPrint("SELECTED INDEX :", indexPAth)
        if let cell = listCollectionView.cellForItem(at: indexPath) as? ListCollectionViewCell {
//            cell.isSelected = true
            self.updateImage(index: indexPAth)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        debugPrint("DESELECTED INDEX :", indexPath.item)
//        if let cell = listCollectionView.cellForItem(at: indexPath) as? ListCollectionViewCell {
//            cell.isSelected = false
//        }
//    }
}
