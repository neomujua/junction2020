//
//  MenuListCell.swift
//  AskKey2
//
//  Created by Wonjun Lee on 2020/10/11.
//

import UIKit

class MenuListCell: UITableViewCell {
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuContents: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
