//
//  FixturesTableViewCell.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {
    @IBOutlet weak var fixturesView: UIView!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
