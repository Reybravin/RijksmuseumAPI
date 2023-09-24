//
//  MuseumService.swift
//  
//
//  Created by Serhii Sachuk on 18.09.2023.
//

import Foundation

public final class MuseumService: IMuseumService {

    // MARK: - Private properties
    private let apiKey: String
    private var language: String
        
    // MARK: - Initialization
    public init(apiKey: String, language: String) {
        self.apiKey = apiKey
        self.language = language
    }
    
    // MARK: - Public methods
    public func fetchMakerArt(searchQuery: String, page: Int) async throws -> ArtObjectList {
        
        let endpoint: MuseumArtsEndpoint = .artByMaker(maker: searchQuery, page: page)
        
        guard let url = MuseumArtsProvider(endpoint: endpoint,
                                           api: apiKey,
                                           language: language).url else {
            throw MuseumDataError.invalidURL
        }
        
        let result: ArtObjectList = try await fetchData(url: url)
        return result
    }
    
    private func fetchData<T: Decodable>(url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
}
