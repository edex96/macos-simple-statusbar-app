//
//  Webservice.swift
//  macos-simple-statusbar-app
//
//  Created by north on 11.01.2024.
//

import Foundation

enum NetworkError: Error{
    case invalidUrl
    case badRequest
}

struct Fact: Decodable{
    let data: [String]
 }


class Webservice{
    func fetchRAndomFact() async throws -> Fact? {
        guard let url = URL(string: "https://meowfacts.herokuapp.com") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NetworkError.badRequest
        }
        
        return try JSONDecoder().decode(Fact.self, from: data)
    }
}
