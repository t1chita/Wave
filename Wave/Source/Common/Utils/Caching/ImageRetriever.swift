//
//  ImageRetriever.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

struct ImageRetriever {

    func fetch(_ imageUrl: String) async throws -> Data {
         guard let url = URL(string: imageUrl) else {
             throw RetrieverError.invalidUrl
         }
         
         let (data, response) = try await URLSession.shared.data(from: url)
         
         if let httpResponse = response as? HTTPURLResponse {
             print("Status Code: \(httpResponse.statusCode)")
         }
         
         return data
     }
     
}

private extension ImageRetriever {
    enum RetrieverError: Error {
        case invalidUrl
    }
}
