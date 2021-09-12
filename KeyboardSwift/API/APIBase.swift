//
//  AppDelegate.swift
//  KeyboardSwift
//
//  Created by Jamil on 2/3/21.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class APIBase {
    
    static let shared = APIBase()
    var header: HTTPHeaders!
    
    // Initialization
    init() {
    
    }
    
    //do request if params are inside of url request body
    func callAPIRequestWithMultipartFormData(urlString: String, method: HTTPMethod, params: Parameters?, header: HTTPHeaders?, completion: @escaping(JSON?, NSError?) -> ()) {
        
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
        
        print("[REQUEST URL]: \(urlString)")
        
        let filename = "recording.flac" //"good-morning-google.flac" //"hello (16bit PCM).wav"
        let path = Bundle.main.path(forResource: filename, ofType: nil)
        let url:URL = params?[APIKey.file_url] as! URL
        print("request url:\(url)")
        
        guard let data = try? Data(contentsOf:url /*URL(fileURLWithPath:path!)*/) else { return }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append("bn".data(using: .utf8)!, withName: "lang")
            multipartFormData.append(data, withName: "file", fileName: filename, mimeType: "audio/wave")
        
        }, to: urlString, method: method, headers: header) { (result) in
            
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    //print("response:\(response.result.value)")
                    let _jsonData = JSON(response.result.value as Any)
                    completion(_jsonData,nil)
                }
            case .failure(let encodingError):
                print("Error Messege:\(encodingError)")
            }
        }
    }
    
    //do request if params are inside of url request body
    func callAPIRequestWithJSONData(urlString: String, method: HTTPMethod, params: Parameters?, header: HTTPHeaders?, completion: @escaping(JSON?, NSError?) -> ()) {
        
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
        
        print("[REQUEST URL]: \(urlString)")
        
        Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in //URLEncoding JSONEncoding
            if let result = response.result.value as? NSDictionary {
                print("\n result::\(result)\n\n")
                let _jsonData = JSON(result as Any)
                completion(_jsonData, nil)
            } else {
                print("response.result.error: \(String(describing: response.result.error))")
                completion(nil, response.result.error as NSError?)
            }
        }
    }
    
    
    //do request if params are outside of url request body
    func callAPIRequestOutsideBodyForJSONData(urlString: String, method:HTTPMethod, params: Parameters?, header: HTTPHeaders?, completion: @escaping(JSON?, NSError?) -> ()){
        
        if /*let jsonData = try? JSONEncoding.encoding(param)*/ true {

            var request = URLRequest(url: URL(string: urlString)!)
            request.httpMethod = method.rawValue
            //request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = nil //jsonData

            Alamofire.request(request).responseJSON { (response) in
                
                print("\n\(response)\n\n")
                
                if let result = response.result.value as? NSArray { 
                    let _jsonData = JSON(["result":result])
                    completion(_jsonData, nil)
                }else if let result = response.result.value as? NSDictionary{
                    let _jsonData = JSON(result as Any)
                    completion(_jsonData, nil)
                } else {
                    print("response.result.error: \(String(describing: response.result.error))")
                    completion(nil, response.result.error as NSError?)
                }
            }
        }
    }

    // Header with Access Token
    func getHeaderWithAccessToken(params:Parameters?) -> [String:String] {
        /*let _message = self.getQuery(params: params)
        let result = try! HMAC(key: API_KEY, variant: .sha256).authenticate(_message.bytes)
        return ["Authorization": "\(result.toHexString())"]*/
        return ["Authorization": ""]
    }
    
}

