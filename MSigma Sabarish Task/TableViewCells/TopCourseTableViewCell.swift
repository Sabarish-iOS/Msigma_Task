//
//  TopCourseTableViewCell.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class TopCourseTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topCollectionView.delegate = self
        self.topCollectionView.dataSource = self
        self.topCollectionView.backgroundColor = .clear
        self.topCollectionView.showsHorizontalScrollIndicator = false
        self.topCollectionView.layer.masksToBounds = true
        self.topCollectionView.layer.cornerRadius = 10.0
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: self.topCollectionView.frame.size.width, height: self.topCollectionView.frame.size.height)
        self.topCollectionView.collectionViewLayout = flowlayout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCourseCollectionViewCell", for: indexPath) as! TopCourseCollectionViewCell
        
        cell.knowBtn.layer.masksToBounds = true
        cell.knowBtn.layer.cornerRadius = cell.knowBtn.frame.size.height / 2

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5.0,left: 10.0,bottom: 5.0,right: 10.0) // top, left, bottom, right
    }

}
