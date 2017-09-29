//
//  MyTabelCellTableViewCell.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import UIKit

class MyTabelCellTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var mybutton: UIButton!
    @IBOutlet weak var closebutton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
