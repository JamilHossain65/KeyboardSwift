//
//  SpeechModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import UIKit
import UIKit
import SwiftyJSON

class SpeechModel: APIBase {
    static let sharedModel = SpeechModel()
    var convertedText:String = ""
    var fileUrl:URL?
    
    func doTranslateRequest(completion: @escaping (Bool, ErrorModel?) -> ()) {
        var params:[String:Any] = [:]
        params[APIKey.file_url] = fileUrl
        
        let header = ["Content-Type":"multipart/form-data"]
        let requestUrl = BASE_URL_TRANSLATE + API_TRANSLATE
        
        APIBase.shared.callAPIRequestWithMultipartFormData(urlString: requestUrl, method: .post, params: params, header: header) { (result, error) in
            if let _result = result {
                self.convertedText = _result[APIKey.converted_text].stringValue;
                completion(true,nil)
            }else{
                completion(false,nil)
            }
        }
    }
    
    /*
    private func parseData(jsonDic: JSON) {
        
        let resultArray = jsonDic["result"].array
        if let _resultArray = resultArray{
            self.userArray = []
            
            for userDic in _resultArray{
                let userModel = UserModel()
                //log("user Name::\(userDic["firstName"])")
                
                userModel.authToken = userDic["authToken"].stringValue
                userModel.avatar    = userDic["avatar"   ].stringValue
                userModel.firstName = userDic["firstName"].stringValue
                userModel.lastName  = userDic["lastName" ].stringValue
                userModel.fullName  = userModel.firstName
                
                if let _lastname = userModel.lastName{
                    userModel.fullName = "\(userModel.fullName ?? "") \(_lastname)"
                }
                
                userModel.userId    = userDic["userId"].intValue
                userArray?.append(userModel)
            }
        }
    } */
}
