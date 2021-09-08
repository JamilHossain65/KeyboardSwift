//
//  SpeechModel.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

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
    
    func doTranslate2(_ completion: @escaping (Errors?) -> ()) {
        doTranslateRequest2(completion: completion)
    }
    
    func doTranslateRequest2(completion: @escaping (Errors?) -> ()) {
        var params:[String:Any] = [:]
        params[APIKey.file_url] = self.fileUrl
        let header = [APIKey.content_type:APIKey.multipart_form]
        let method = APIKey.POST
        let url = BASE_URL_TRANSLATE + API_TRANSLATE
        
        
        self.requestMultipartForm(url,method,header,params) { (result, error) in
            DispatchQueue.main.async {
                if let _result = result {
                    self.convertedText = _result[APIKey.converted_text].stringValue
                    completion(nil)
                } else {
                    let message = error?.localizedDescription
                    let _error = Errors(message: message)
                    completion(_error)
                }
            }
        }
    }
    
    //do request if params are inside of url request body
    func requestMultipartFormData(url: String, method: String?, header: [String:String]?, params: [String:Any]?, completion: @escaping(JSON?, Error?) -> ()){
        requestMultipartForm(url, method, header, params, completion: completion)
    }
    
    //do request if params are inside of url request body
    func requestMultipartForm(_ url: String, _ method: String?, _ header: [String:String]?, _ params: [String:Any]?, completion: @escaping(JSON?, Error?) -> ()) {
        
        //check internet
        if !Reachability.isConnectedToNetwork() {
            //ProgressHUD.shared.hide()
            showAlertOkay(message: "Not connected to the internet")
            return
        }
        
        // debug print
        if let _header = header {
            print("[REQUEST HEADER]: \(_header)")
        }
        
        if let _param = params {
            print("[REQUEST PARAM]: \(_param)")
        }
        
        print("[REQUEST URL]: \(url)")
        
        
        let filename = "recording.flac" //"good-morning-google.flac" //"hello (16bit PCM).wav"
        //let path = Bundle.main.path(forResource: filename, ofType: nil)
        let fileUrl:URL = params?[APIKey.file_url] as! URL
        guard let data = try? Data(contentsOf:fileUrl/*URL(fileURLWithPath:path!)*/) else { return }
        
        //guard let url2 = URL(string: url) else { return }
        
        let request = APIRequest(url)
        request.uploadFile(paramName: "file", fileName: filename, fileData: data, mimeType: "audio/wav",completion: { (json,error) in
            if let _response = json {
                completion(JSON(_response),nil)
            } else {
                completion(nil,error)
            }
        })
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
