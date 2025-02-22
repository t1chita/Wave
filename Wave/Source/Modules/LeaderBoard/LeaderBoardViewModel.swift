//
//  LeaderBoardViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation
import NetworkingPackage

@Observable
final class LeaderBoardViewModel {
    var mockUsers: [User] = []
    
    var topThree: [User] {
         Array(mockUsers.prefix(3))
     }

     var remainingUsers: [User] {
         Array(mockUsers.dropFirst(3))
     }
    
    init() {
        getLeaderBoard()
    }
    
    func getLeaderBoard() {
        NetworkService.shared.sendRequest(endPoint: EndPointsManager.getLeaderBoard(token: UserManager.shared.authResponse?.access ?? "")) { [weak self] (result: Result<[User], NetworkError>) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let users):
                    self?.mockUsers = users
                case .failure(let error):
                    print("DEBUG Cant Fetch LeaderBoard Users: \(error)")
                }
            }
        }
    }
}
