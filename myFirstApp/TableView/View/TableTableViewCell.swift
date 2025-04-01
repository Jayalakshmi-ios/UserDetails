//
//  TableTableViewCell.swift
//  myFirstApp
//
//  Created by Jayalakshmi
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var userlabel: UILabel!
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var bodylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
