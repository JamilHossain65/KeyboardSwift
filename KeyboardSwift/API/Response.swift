//
//  ErrorModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit

struct Response {
    //Api response
    let success:Bool =  true
    let json: [String:Any]?
    var array: [Any]?
    
    init(_ json:Any) {
        self.json = json as? [String:Any]
    }
    
    mutating func initWith(_ array:[Any]) {
        self.array = array
    }
}
