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
    var user: User?
    
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
    
    func getUser(
        completion: @escaping (Bool) -> Void
    ) {
        guard let token = authResponse?.access else {
            print("DEBUG: Token not found")
            return
        }
        
        NetworkService.shared.sendRequest(endPoint: EndPointsManager.getProfile(token: token)) { [weak self] (result: Result<User, NetworkError>) in
            switch result {
            case .success(let success):
                self?.user = success
                completion(true)
            case .failure(let failure):
                completion(false)
                print("DEBUG: Can't get user: \(failure)")
            }
        }
    }
}
