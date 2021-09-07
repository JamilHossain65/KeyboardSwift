//
//  ErrorModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit

struct Errors {
    //Api error response
    var message  :String
    var status   : String = ""

    var error_code : Int = 0
    var success    : Bool = false
}
