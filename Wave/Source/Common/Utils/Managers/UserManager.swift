//
//  UserManager.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation
import NetworkingPackage

final class UserManager {
    static let shared = UserManager()
    
    var authResponse: AuthModel?
   
    private init() { }

    func registerUser(
        withName name: String,
        lastName: String,
        password: String,
        email: String,
        completion: @escaping (Bool) -> Void
    ) {
        NetworkService.shared.sendRequest(
            endPoint: EndPointsManager.registerUser(
                name: name,
                lastName: lastName,
                password: password,
                email: email
            )) { [weak self] (result: Result<AuthModel, NetworkError>) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let success):
                    self?.authResponse = success
                    completion(true)
                case .failure(let failure):
                    print("DEBUG: Can't register user: \(failure)")
                    completion(false)
                }
            }
        }
    }
    
    
    func logIn(
        withEmail email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        NetworkService.shared.sendRequest(
            endPoint: EndPointsManager.logIn(
                password: password,
                email: email
            )) { [weak self] (result: Result<AuthModel, NetworkError>) in
                DispatchQueue.main.async { [weak self] in
                    switch result {
                    case .success(let success):
                        self?.authResponse = success
                        completion(true)
                    case .failure(let failure):
                        print("DEBUG: Can't LogIn user: \(failure)")
                        completion(false)
                    }
                }
            }
    }
}
