//
//  BranchViewController.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class BranchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var branchCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var filterHeight: NSLayoutConstraint!
    @IBOutlet weak var nodataLbl: UILabel!
    
    var getBranchData : BranchBase? = nil
    
    var Filterarr = [String]()
    var filteredDataArray = [String]()
    var isFiltered = false
    var filteredName = ""
    var filteredShort = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nodataLbl.isHidden = true
        // Do any additional setup after loading the view.
        self.callBranchAPI()
        
        self.backBtn.tintColor = .white
        self.backBtn.addTarget(self, action: #selector(backBtnTapped(sender: )), for: .touchUpInside)
        
        self.searchTextField.layer.masksToBounds = true
        self.searchTextField.layer.cornerRadius = self.searchTextField.frame.size.height / 2
        self.searchTextField.placeholder = "Search course, program"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.searchTextField.frame.size.height))
        self.searchTextField.leftViewMode = .always
        self.searchTextField.leftView = paddingView
        
        let imgView = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: self.searchTextField.frame.size.height - 10))
        imgView.image = UIImage(named: "Search")
        paddingView.addSubview(imgView)
        
        
        
        self.branchCollectionView.delegate = self
        self.branchCollectionView.dataSource = self
        self.branchCollectionView.backgroundColor = .clear
        self.branchCollectionView.showsVerticalScrollIndicator = false
        self.branchCollectionView.layer.masksToBounds = true
        self.branchCollectionView.layer.cornerRadius = 10.0
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.6, height: 130)
        self.branchCollectionView.collectionViewLayout = flowlayout
        
        self.searchTextField.delegate = self
//        self.updateFilteredData()
        
        self.filterTableView.delegate = self
        self.filterTableView.dataSource = self
        self.filterTableView.showsVerticalScrollIndicator = false
        self.filterTableView.isHidden = true
        self.branchCollectionView.isScrollEnabled = true
        self.filterTableView.clipsToBounds = true
        self.filterTableView.layer.borderWidth = 0.2
        
    }
    
    @objc func backBtnTapped(sender: UIButton){
        self.dismiss(animated: true)
    }

    func callBranchAPI(){
        BranchViewModel().getBranchDetails(url: "https://api.msigma.in/btech/v2/branches") { result in
            switch result{
            case .success(let data):
                self.getBranchData = data
                DispatchQueue.main.async {
                    self.Filterarr = [String]()
                    for i in 0...(self.getBranchData?.branches!.count)! - 1{
                        self.Filterarr.append(self.getBranchData?.branches?[i].short ?? "")
                        self.Filterarr.append(self.getBranchData?.branches?[i].name ?? "")
                    }
                    self.branchCollectionView.reloadData()
                    print(self.Filterarr)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Combine the current text in the text field with the new input
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if newText.count > 0{
            self.filterTableView.isHidden = false
            self.branchCollectionView.isScrollEnabled = false
            updateFilteredData(with: newText)
        }else{
            self.filterTableView.isHidden = true
            self.branchCollectionView.isScrollEnabled = true
            self.isFiltered = false
            self.branchCollectionView.reloadData()
        }
            // Update the filtered array based on the new text
           
            
            return true
        }
        
    
    func updateFilteredData(with searchText: String? = nil) {
            if let searchText = searchText, !searchText.isEmpty {
                filteredDataArray = Filterarr.filter { $0.lowercased().contains(searchText.lowercased()) }
            } else {
                filteredDataArray = Filterarr
            }
        if filteredDataArray.count == 0{
            self.branchCollectionView.isHidden = true
            self.filterTableView.isHidden = true
            self.nodataLbl.isHidden = false
        }else{
            self.branchCollectionView.isHidden = false
            self.filterTableView.isHidden = false
            self.nodataLbl.isHidden = true
        }
        self.filterTableView.reloadData()
        }
    
    //CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.isFiltered == true{
            return 1
        }else{
            return self.getBranchData?.branches!.count ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BranchCollectionViewCell", for: indexPath) as! BranchCollectionViewCell
        
        cell.baseView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.baseView.layer.shadowOpacity = 0.5
        cell.baseView.layer.shadowOffset = CGSize.zero
        cell.baseView.layer.shadowRadius = 5
        cell.baseView.layer.cornerRadius = 10.0
        
        if self.isFiltered == true{
            cell.titleLbl.text = self.filteredShort
            cell.descLbl.text = self.filteredName
        }else{
            cell.titleLbl.text = self.getBranchData?.branches?[indexPath.row].short ?? ""
            cell.descLbl.text = self.getBranchData?.branches?[indexPath.row].name ?? ""
        }
        
        return cell
    }
    
    
    //TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        cell.selectionStyle = .none
        if filteredDataArray.count <= 10{
            self.filterHeight.constant = CGFloat(self.filteredDataArray.count) * 41.66
        }else{
            self.filterHeight.constant = 450
        }
        cell.filterLbl.text = self.filteredDataArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchTextField.text = self.filteredDataArray[indexPath.row]
        self.filterTableView.isHidden = true
        self.branchCollectionView.isScrollEnabled = true
        self.isFiltered = true
        if ((self.getBranchData?.branches?[indexPath.row].short?.contains(self.searchTextField.text ?? "")) != nil){
            self.filteredName = (self.getBranchData?.branches?[indexPath.row].name)!
            self.filteredShort = (self.getBranchData?.branches?[indexPath.row].short)!
        }
        self.branchCollectionView.reloadData()
        self.searchTextField.resignFirstResponder()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

