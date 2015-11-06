//
//  DealsCell.swift
//  DesidimeApp
//
//  Created by Sanjay Mali on 05/11/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import UIKit

class DealsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var company_Name: UILabel!
    @IBOutlet weak var product_Image: UIImageView!
    @IBOutlet weak var discount_off: UILabel!
    @IBOutlet weak var back_view: UIView!
    @IBOutlet weak var number_Label2: UILabel!
    @IBOutlet weak var number_Label: UILabel!
    @IBOutlet weak var discr_Label: UILabel!
    @IBOutlet weak var title_Label: UILabel!
    @IBOutlet weak var bottom_view: UIView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
