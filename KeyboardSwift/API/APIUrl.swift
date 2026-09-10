//
//  APIUrlConstant.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit


// BASE URL
#if DEBUG
    let BASE_URL = "http://vaticsoft.pythonanywhere.com"
#else
    let BASE_URL = "http://vaticsoft.pythonanywhere.com"
#endif

//LOGIN
let API_LOGIN = "/login/"
let API_TEST  = "/test/"
let API_TEST2 = "/test2/"

let API_TRANSLATE      = "/convert/text" //"/convert/voice/lang/"
//"/convert/voice/lang/"
let BASE_URL_TRANSLATE = "http://vaticsoft.pythonanywhere.com" //"http://127.0.0.1:5000/"
