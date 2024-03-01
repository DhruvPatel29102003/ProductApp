//
//  InitialViewController.swift
//  Product1
//
//  Created by Droadmin on 29/11/23.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var scBtn: UIButton!
    @IBOutlet weak var tabbarLikeView: UIView!
    
    @IBOutlet weak var tabView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scBtn.layer.cornerRadius = 25
        tabView.layer.shadowColor = UIColor.black.cgColor
        tabView.layer.shadowOpacity = 1
        tabView.layer.shadowOffset = .zero
        tabView.layer.shadowRadius = 10
        tabView.layer.cornerRadius = 10
    }
    func alertBox(){
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        alertBox()
    }
    
    @IBAction func shoppingBtn(_ sender: UIBarButtonItem) {
        alertBox()
    }

    
}


