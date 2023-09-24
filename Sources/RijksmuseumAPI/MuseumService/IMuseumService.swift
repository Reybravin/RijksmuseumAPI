//
//  IMuseumService.swift
//  
//
//  Created by Serhii Sachuk on 18.09.2023.
//

import Foundation

public protocol IMuseumService {
    func fetchMakerArt(searchQuery: String, page: Int) async throws -> ArtObjectList
}
