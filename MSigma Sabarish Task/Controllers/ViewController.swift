//
//  ViewController.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var topPageControl: UIPageControl!
    @IBOutlet weak var baseTableView: UITableView!
    
    let titleArr = ["Resume from where you left", "Explore courses", "Featured subjects", "Top crash courses"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.searchBtn.layer.masksToBounds = true
        self.searchBtn.layer.cornerRadius = self.searchBtn.frame.size.height / 2
        self.searchBtn.backgroundColor = UIColor.white
        self.searchBtn.tintColor = UIColor.black
        
        self.notificationBtn.layer.masksToBounds = true
        self.notificationBtn.layer.cornerRadius = self.searchBtn.frame.size.height / 2
        self.notificationBtn.backgroundColor = UIColor.white
        self.notificationBtn.tintColor = UIColor.black
        
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
        flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 48, height: self.topCollectionView.frame.size.height)
        self.topCollectionView.collectionViewLayout = flowlayout
        
        self.topPageControl.currentPage = 0
        self.topPageControl.pageIndicatorTintColor = UIColor.lightGray
        self.topPageControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
        self.baseTableView.showsVerticalScrollIndicator = false
        self.baseTableView.separatorStyle = .none
        
    }

    //CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CallNowCollectionViewCell", for: indexPath) as! CallNowCollectionViewCell
        
        cell.baseView.layer.masksToBounds = true
        cell.baseView.layer.cornerRadius = self.searchBtn.frame.size.height / 2
        cell.baseView.backgroundColor = UIColor.init(red: 255.0/255.0, green: 239.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        cell.titleLbl.textColor = UIColor.init(red: 112.0/255.0, green: 69.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        cell.descLbl.textColor = UIColor.init(red: 112.0/255.0, green: 69.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        cell.callNowbtn.backgroundColor = UIColor.init(red: 234.0/255.0, green: 150.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        
        cell.callNowbtn.setTitleColor(UIColor.white, for: .normal)
        cell.callNowbtn.layer.masksToBounds = true
        cell.callNowbtn.layer.cornerRadius = cell.callNowbtn.frame.self.height / 2

        return cell
    }
    
    //TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
            cell.selectionStyle = .none
            
            cell.titleLbl.text = self.titleArr[indexPath.row/2]
            if indexPath.row == 0{
                cell.seeAllBtn.isHidden = true
            }
            cell.seeAllBtn.tintColor = .black
            
            return cell
        }else{
            if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ResumeTableViewCell", for: indexPath) as! ResumeTableViewCell
                cell.selectionStyle = .none
                
                cell.baseView.layer.shadowColor = UIColor.lightGray.cgColor
                cell.baseView.layer.shadowOpacity = 0.5
                cell.baseView.layer.shadowOffset = CGSize.zero
                cell.baseView.layer.shadowRadius = 5
                cell.baseView.layer.cornerRadius = 10.0
                
                cell.timeLbl.textColor = UIColor.init(red: 234.0/255.0, green: 150.0/255.0, blue: 38.0/255.0, alpha: 1.0)
                
                return cell
            }else if indexPath.row == 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
                cell.selectionStyle = .none
                
                cell.btnOne.addTarget(self, action: #selector(NavBtnTapped(sender: )), for: .touchUpInside)
                cell.btnTwo.addTarget(self, action: #selector(NavBtnTapped(sender: )), for: .touchUpInside)
                cell.btnThree.addTarget(self, action: #selector(NavBtnTapped(sender: )), for: .touchUpInside)
                cell.btnFour.addTarget(self, action: #selector(NavBtnTapped(sender: )), for: .touchUpInside)
                
                return cell
            }else if indexPath.row == 5{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureTableViewCell", for: indexPath) as! FeatureTableViewCell
                cell.selectionStyle = .none
                
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "TopCourseTableViewCell", for: indexPath) as! TopCourseTableViewCell
                cell.selectionStyle = .none
                
                
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func NavBtnTapped(sender: UIButton){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BranchViewController") as! BranchViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
}

