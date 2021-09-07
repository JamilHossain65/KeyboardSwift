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
    //let array: [Any]?
    
    init(_ json:[String:Any]) {
        self.json = json
    }
    
//    init(_ array:[Any]) {
//        if let _array = array {
//            self.array = array
//        }else{
//            self.array = []
//        }
//    }
}
