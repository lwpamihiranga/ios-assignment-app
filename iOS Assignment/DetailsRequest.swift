 //
//  DetailsRequest.swift
//  iOS Assignment
//
//  Created by Amith Mihiranga on 7/28/20.
//  Copyright © 2020 Amith Mihiranga. All rights reserved.
//

import Foundation

 enum DetailsError:Error {
    case noDataAvailable
    case cannotProcessData
 }

 struct DetailRequest {
    let resourceURL:URL
    
    init() {
        let resourceString = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getDetails (completion: @escaping(Result<[MyDetail], DetailsError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decorder = JSONDecoder()
                let detailsResponse = try decorder.decode(DetailsResponse.self, from: jsonData)
                let details = detailsResponse.response.details
                completion(.success(details))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
 }
