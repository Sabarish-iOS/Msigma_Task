//
//  BranchBase.swift
//  MSigma Sabarish Task
//
//  Created by Apple8 on 23/11/23.
//

import Foundation

class BranchBase : Codable {
    let status : String?
    let branches : [Branches]?
}
class Branches : Codable{
    let id : Int?
    let name : String?
    let short : String?

}

