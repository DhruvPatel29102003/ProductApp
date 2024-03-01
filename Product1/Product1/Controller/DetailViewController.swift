//
//  DetailViewController.swift
//  Product
//
//  Created by Manan Kakadiya on 28/11/23.
//

import UIKit

class DetailViewController: UIViewController {
    let titleName:[String] = ["Use Type","Fragarnce","Liquate Voliume","Net"]
    var image: String? = nil
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        imageView.image = UIImage(named: image ?? "")

        // Do any additional setup after loading the view.
    }



}
extension DetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailViewCollectionViewCell", for: indexPath) as! DetailViewCollectionViewCell
        cell.titleLbl.text = titleName[indexPath.row]
        return cell
    }
    
    
}
