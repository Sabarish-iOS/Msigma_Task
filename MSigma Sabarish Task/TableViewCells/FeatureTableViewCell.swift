//
//  FeatureTableViewCell.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class FeatureTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var featureCollectionView: UICollectionView!
    
    let imgArr = ["Elena","James"]
    let SubjectArr = ["B.Tech ECE", "B.Tech ECE"]
    let bookArr = ["Signals & Systems", "Digital Signal"]
    let professorNameArr = ["By Hari Krishna", "By Mishra Sir"]
    let price = ["₹749.0","₹123.6"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.featureCollectionView.delegate = self
        self.featureCollectionView.dataSource = self
        self.featureCollectionView.backgroundColor = .clear
        self.featureCollectionView.showsHorizontalScrollIndicator = false
        self.featureCollectionView.layer.masksToBounds = true
        self.featureCollectionView.layer.cornerRadius = 10.0
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: self.featureCollectionView.frame.size.width / 2.5, height: self.featureCollectionView.frame.size.height)
        self.featureCollectionView.collectionViewLayout = flowlayout
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedSubCollectionViewCell", for: indexPath) as! FeaturedSubCollectionViewCell
        
        cell.baseView.layer.masksToBounds = false
        cell.baseView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.baseView.layer.shadowOpacity = 1.0
        cell.baseView.layer.shadowOffset = CGSize.zero
        cell.baseView.layer.shadowRadius = 5
        
        cell.profileImg.image = UIImage(named: self.imgArr[indexPath.item])
        cell.Subjectlbl.text = self.SubjectArr[indexPath.item]
        cell.bookNameLbl.text = self.bookArr[indexPath.item]
        cell.professorNameLbl.text = self.professorNameArr[indexPath.item]
        cell.priceLbl.text = self.price[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5.0,left: 10.0,bottom: 5.0,right: 5.0) // top, left, bottom, right
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
