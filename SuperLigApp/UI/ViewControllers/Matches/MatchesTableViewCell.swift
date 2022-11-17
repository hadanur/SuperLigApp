//
//  MatchesTableViewCell.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    @IBOutlet weak var matchesView: UIView!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
