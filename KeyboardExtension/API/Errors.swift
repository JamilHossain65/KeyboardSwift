//
//  ErrorModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit

struct Errors {
    //Api error response
    var message : String?
    var status  : String? = ""
    var success : Bool?   = false
    var info    : Any?    = nil
    var error_code : Int? = 0
}
