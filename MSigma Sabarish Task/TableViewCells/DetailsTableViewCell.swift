//
//  DetailsTableViewCell.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var ViewOne: UIView!
    @IBOutlet weak var offerOne: UILabel!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var offerTwo: UILabel!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var offerThree: UILabel!
    @IBOutlet weak var viewFour: UIView!
    
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                
        self.ViewOne.layer.shadowColor = UIColor.lightGray.cgColor
        self.ViewOne.layer.shadowOpacity = 0.5
        self.ViewOne.layer.shadowOffset = CGSize.zero
        self.ViewOne.layer.shadowRadius = 5
        self.ViewOne.layer.cornerRadius = 10.0
        
        self.viewTwo.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewTwo.layer.shadowOpacity = 0.5
        self.viewTwo.layer.shadowOffset = CGSize.zero
        self.viewTwo.layer.shadowRadius = 5
        self.viewTwo.layer.cornerRadius = 10.0
        
        self.viewThree.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewThree.layer.shadowOpacity = 0.5
        self.viewThree.layer.shadowOffset = CGSize.zero
        self.viewThree.layer.shadowRadius = 5
        self.viewThree.layer.cornerRadius = 10.0
        
        self.viewFour.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewFour.layer.shadowOpacity = 0.5
        self.viewFour.layer.shadowOffset = CGSize.zero
        self.viewFour.layer.shadowRadius = 5
        self.viewFour.layer.cornerRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
