//
//  TableViewCell.swift
//  MusicBand
//
//  Created by Carlos Alberto Rangel Garcia on 29/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var artistaLabel: UILabel!
    
    @IBOutlet weak var generoLabel: UILabel!
    
    @IBOutlet weak var artistaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
