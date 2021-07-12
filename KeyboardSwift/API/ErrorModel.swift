//
//  ErrorModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit

class ErrorModel: NSObject {
    //Api error response
    var message  : String?
    var status   : String?

    var error_code : Int?
    var success    : Bool?
}
