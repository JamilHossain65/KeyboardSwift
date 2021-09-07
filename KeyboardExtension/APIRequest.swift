//
//  APIRequest.swift
//  KeyboardExtension
//
//  Created by Jamil on 8/8/21.
//

import UIKit

enum Method {
    case get, post
}

struct APIRequest {
    private let boundary: String = UUID().uuidString
    private var httpBody = NSMutableData()
    let url: URL

    init(_ url: String) {
        if let _url = URL(string: url){
            self.url = _url
        }else{
            self.url = URL(string: "")!
        }
    }
    
    //MARK:- REQUEST API WITH PARAMETERS
    func params(_ params:[String: Any], method:Method,header:String, completion:@escaping (Response?, Errors?) -> () ){
        //Debug Prints
        print("calling api....")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    DispatchQueue.main.async {
                        completion(Response(json),nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    let message = error?.localizedDescription ?? ""
                    var errors = Errors(message: message)
                    errors.status = ""
                    completion(nil,errors)
                }
            }
        }
        task.resume()
    }
    
    
    func uploadFile(paramName: String, fileName: String, fileData: Data, mimeType:String,completion:@escaping (Any?, Error?) -> Void) {
        //https://stackoverflow.com/questions/41032678/upload-image-to-server-swift-3
        print("calling api.....")
        //let url = URL(string: "http://jamilhossain.pythonanywhere.com/test/file/")
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        let session = URLSession.shared
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)//image/png
        data.append(fileData)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                completion(jsonData,nil)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }else{
                completion(nil,error)
            }
        }).resume()
    }
    
    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        httpBody.append("--\(boundary)--".data(using: .utf8)!)
        //httpBody.appendString("--\(boundary)--")
        request.httpBody = httpBody as Data
        return request
    }
    
    func addTextField(named name: String, value: String) {
        httpBody.append(textFormField(named: name, value: value))
    }
    
    private func textFormField(named name: String, value: String) -> String {
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "Content-Type: text/plain; charset=ISO-8859-1\r\n"
        fieldString += "Content-Transfer-Encoding: 8bit\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"
        
        return fieldString
    }
    
    func addDataField(named name: String, data: Data, mimeType: String) {
        httpBody.append(dataFormField(named: name, data: data, mimeType: mimeType))
    }
    
    private func dataFormField(named name: String,
                               data: Data,
                               mimeType: String) -> Data {
        let fieldData = NSMutableData()
        
        fieldData.append("--\(boundary)\r\n")
        fieldData.append("Content-Disposition: form-data; name=\"\(name)\"\r\n")
        fieldData.append("Content-Type: \(mimeType)\r\n")
        fieldData.append("\r\n")
        fieldData.append(data)
        fieldData.append("\r\n")
        
        return fieldData as Data
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //print("path::\(paths)")
        return paths[0]
    }
    
    /*
     public func UPLOADIMG(url: String,parameters: Dictionary<String,AnyObject>?,filename:String,image:UIImage, success:((NSDictionary) -> Void)!, failed:((NSDictionary) -> Void)!, errord:((NSError) -> Void)!) {
     var TWITTERFON_FORM_BOUNDARY:String = "AaB03x"
     let url = URL(string: url)!
     var request:NSMutableURLRequest = NSMutableURLRequest(URL: url as URL, cachePolicy: NSURLRequest.CachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 10)
     var MPboundary:String = "--\(TWITTERFON_FORM_BOUNDARY)"
     var endMPboundary:String = "\(MPboundary)--"
     //convert UIImage to NSData
     var data:NSData = UIImagePNGRepresentation(image) as! NSData
     var body:NSMutableString = NSMutableString();
     // with other params
     if parameters != nil {
     for (key, value) in parameters! {
     body.appendFormat("\(MPboundary)\r\n" as NSString)
     body.appendFormat("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
     body.appendFormat("\(value)\r\n" as NSString)
     }
     }
     // set upload image, name is the key of image
     body.appendFormat("%@\r\n",MPboundary)
     body.appendFormat("Content-Disposition: form-data; name=\"\(filename)\"; filename=\"pen111.png\"\r\n")
     body.appendFormat("Content-Type: image/png\r\n\r\n")
     var end:String = "\r\n\(endMPboundary)"
     var myRequestData:NSMutableData = NSMutableData();
     myRequestData.appendData(body.dataUsingEncoding(NSUTF8StringEncoding.rawValue)!)
     myRequestData.appendData(data as Data)
     myRequestData.append(end.dataUsingEncoding(NSUTF8StringEncoding)!)
     var content:String = "multipart/form-data; boundary=\(TWITTERFON_FORM_BOUNDARY)"
     request.setValue(content, forHTTPHeaderField: "Content-Type")
     request.setValue("\(myRequestData.length)", forHTTPHeaderField: "Content-Length")
     request.httpBody = myRequestData as Data
     request.httpMethod = "POST"
     //        var conn:NSURLConnection = NSURLConnection(request: request, delegate: self)!
     let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
     data, response, error in
     if error != nil {
     println(error)
     errord(error)
     return
     }
     var parseError: NSError?
     let responseObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &parseError)
     if let responseDictionary = responseObject as? NSDictionary {
     success(responseDictionary)
     } else {
     }
     
     })
     task.resume()
     
     }
     */
}

extension NSMutableData {
    func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}

//extension URLSession {
//    func dataTask(with request: APIRequest,
//                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
//    -> URLSessionDataTask {
//        return dataTask(with: request.asURLRequest(), completionHandler: completionHandler)
//    }
//}
