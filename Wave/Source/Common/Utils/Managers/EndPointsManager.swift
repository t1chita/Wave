//
//  EndPointsManager.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation
import NetworkingPackage


/// Enum that manages API endpoints for the application.
enum EndPointsManager {
    case registerUser(name: String, lastName: String, password: String, email: String)
    case logIn(password: String, email: String)
    case getMerchants(token: String)
    case getLeaderBoard(token: String)
}

extension EndPointsManager: EndPoint {
    // MARK: - EndPoint Protocol Implementation
    
    /// Host URL for the API.
    var host: String {
        switch self {
            
        case .registerUser, .logIn, .getMerchants, .getLeaderBoard:
            return "ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com"
        }
    }
    
    /// Scheme to be used for the API request (e.g., HTTP or HTTPS).
    var scheme: String {
        switch self {
        case .registerUser, .logIn, .getMerchants, .getLeaderBoard:
            return "http"
        }
    }
    
    /// Path for the API endpoint.
    var path: String {
        switch self {
        case .registerUser:
            return "/api/register/"
        case .logIn:
            return "/api/login/"
        case .getMerchants:
            return "/api/merchants/"
        case .getLeaderBoard:
            return "/api/leaderboard/"

        }
    }
    
    /// HTTP method to be used for the request (GET, POST, etc.).
    var method: NetworkingPackage.RequestMethod {
        switch self {
        case .registerUser, .logIn:
                .post
        case .getMerchants , .getLeaderBoard:
                .get
        }
    }
    
    /// HTTP headers to be included in the request.
    var header: [String : String]? {
        switch self {
        case .registerUser, .logIn:
            return [
                   "Content-Type": "application/json",
                   "Accept": "*/*",
                   "Accept-Encoding": "gzip, deflate, br",
                   "Connection": "keep-alive"
               ]
        case .getMerchants(let token), .getLeaderBoard(let token):
            return [
                  "Content-Type": "application/json",
                  "Accept": "*/*",
                  "Accept-Encoding": "gzip, deflate, br",
                  "Connection": "keep-alive",
                  "Authorization": "Bearer \(token)"
              ]
        }
    }
    
    /// Request body parameters to be sent with the API request.
    var body: [String : NetworkingPackage.AnyEncodable]? {
        switch self {
        case .registerUser(let name, let lastName, let password, let email):
            return [
                "first_name": AnyEncodable(name),
                "last_name": AnyEncodable(lastName),
                "password": AnyEncodable(password),
                "email": AnyEncodable(email)
            ]
        case .logIn(let password, let email):
            return [
                "password": AnyEncodable(password),
                "email": AnyEncodable(email)
            ]
        case .getMerchants, .getLeaderBoard:
            return nil
        }
    }
    
    /// Query parameters for the API request, if any.
    var queryParams: [String : NetworkingPackage.AnyEncodable]? {
        switch self {
        case .registerUser, .logIn, .getMerchants, .getLeaderBoard:
            return nil
        }
    }
    
    /// Path parameters for the API request, if any.
    var pathParams: [String : String]? {
        switch self {
        case .registerUser, .logIn, .getMerchants, .getLeaderBoard:
            return nil
        }
    }
}
