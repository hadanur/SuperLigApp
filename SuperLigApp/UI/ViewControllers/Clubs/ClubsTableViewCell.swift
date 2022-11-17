//
//  ClubsTableViewCell.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class ClubsTableViewCell: UITableViewCell {

    @IBOutlet weak var clubView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clubNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
