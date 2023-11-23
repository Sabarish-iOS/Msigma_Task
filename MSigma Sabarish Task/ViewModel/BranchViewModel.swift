//
//  BranchViewModel.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import UIKit

class BranchViewModel: NSObject {
    override init() {
        super.init()
    }
    func getBranchDetails(url:String, result: @escaping(Result<BranchBase?,ApiError>) -> Void){
        ApiManager.shared.fetch(baseUrl: url, methodType: .get, contentType: .applicationJson, param: "", completion: result)
    }
}
