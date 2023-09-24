//
//  MuseumServiceTests.swift
//  
//
//  Created by Serhii Sachuk on 24.09.2023.
//

import XCTest
@testable import RijksmuseumAPI

final class MuseumServiceTests: XCTestCase {
    
    var sut: MuseumService!
    
    override func setUpWithError() throws {
        sut = MuseumService(apiKey: "", language: "nl")
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testFetchMakerArt() async throws {
        let result = try await sut.fetchMakerArt(searchQuery: "Rembrandt", page: 1)
        XCTAssertNotNil(result.artObjects)
    }
    
}
