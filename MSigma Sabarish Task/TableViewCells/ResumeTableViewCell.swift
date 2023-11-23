//
//  ResumeTableViewCell.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class ResumeTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
