//
//  ServiceCall.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import Moya
import SwiftyJSON
import Foundation

class ServiceCall {
    class func post(parameter: NSDictionary, path: String, isToken: Bool = false, withSuccess: @escaping ( (_ responseObj: AnyObject?) ->() ), failure: @escaping ( (_ error: Error?) ->() ) ) {
           MoyaProvider<ApiService>().request(.postData(parameters: parameter as! [String: Any], path: path, requiresToken: isToken)) { result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let response):
                       do {
                           let json = try JSON(data: response.data)
                           debugPrint("Response JSON: \(json)")
                           withSuccess(json.dictionaryObject as AnyObject)
                       } catch {
                           debugPrint("JSON Parsing Error: \(error)")
                           failure(error)
                       }
                   case .failure(let error):
                       debugPrint("API Request Error: \(error)")
                       failure(error)
                   }
               }
           }
       }}


enum ApiService: TargetType {
    var baseURL: URL { return URL(string: Globs.BASE_URL)! }

    var path: String {
        switch self {
        case .postData(parameters: _, let path, _):
            return path
        }
    }

    var method: Moya.Method {
        switch self {
        case .postData:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .postData(let parameters, _, _):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        var headers = ["Content-Type": "application/x-www-form-urlencoded"]
        switch self {
        case .postData(_, _, let requiresToken):
            if requiresToken {
                if let token = MainViewModel.shared.userObj.authToken {
                    headers["access_token"] = token
                }
            }
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                headers["access_token"] = "DKA1um38VaT7zmyL1gUZ"
            }
            return headers
        }
    }

    case postData(parameters: [String: Any], path: String, requiresToken: Bool)
}
