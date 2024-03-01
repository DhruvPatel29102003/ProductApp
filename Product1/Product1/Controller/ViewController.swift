//
//  ViewController.swift
//  Product
//
//  Created by Manan Kakadiya on 28/11/23.
//

import UIKit

class ViewController: UIViewController {
    let menu:[String] = ["All","Face","Body","Hair","eye","Nail"]
    let productImage:[String] = ["image1","image2","image3","image4"]
    var selectedIndexPath: IndexPath?
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
   // @IBOutlet weak var tabBarLikeView: UIView!
    @IBOutlet weak var tableViewHight: NSLayoutConstraint!
    @IBOutlet weak var recentProductTableView: UITableView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recentProductTableView.separatorStyle = .none

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.lightGray

        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.menuCollectionView {
            return menu.count
        }else{
            return productImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.menuCollectionView {
            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
            cell.menuLbl.text = menu[indexPath.item]
            cell.layer.cornerRadius = 10
            return cell
        }else {
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.productImage.image = UIImage(named: productImage[indexPath.item])
            cell.productImage.layer.cornerRadius = 10
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.menuCollectionView {
            let cell = menuCollectionView.cellForItem(at: indexPath) as! MenuCollectionViewCell
            selectedIndexPath = indexPath

            if selectedIndexPath != nil {
                cell.menuLbl.textColor = UIColor.white
                cell.menuLbl.backgroundColor = UIColor.orange
            }
            
        }
        else
        {
            let detilVc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            detilVc.image = productImage[indexPath.row]
            navigationController?.pushViewController(detilVc, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.menuCollectionView {
            
            let cell = menuCollectionView.cellForItem(at: indexPath) as! MenuCollectionViewCell
            cell.menuLbl.textColor = UIColor.black
            cell.menuLbl.backgroundColor = UIColor(red: 0.904, green: 0.905, blue: 0.898, alpha: 1)
        }
    }
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recentProductTableView.dequeueReusableCell(withIdentifier: "RecentProductTableViewCell", for: indexPath) as! RecentProductTableViewCell
        cell.productImage.image = UIImage(named: productImage[indexPath.row])
        cell.persantageLbl.layer.masksToBounds = true
        cell.persantageLbl.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
        cell.productImage.layer.cornerRadius = 10
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.tableViewHight.constant = self.recentProductTableView.contentSize.height
        })
        return cell
    }
    
    
}
