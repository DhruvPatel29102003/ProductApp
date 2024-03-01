//
//  RecentProductTableViewCell.swift
//  Product
//
//  Created by Manan Kakadiya on 28/11/23.
//

import UIKit

class RecentProductTableViewCell: UITableViewCell {

    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var persantageLbl: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
