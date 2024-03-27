//
//  NetworkRepositoryImpl.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import Foundation

final class NetworkRepositoryImpl: NetworkRepository {
    private let jsonDecoder: JSONDecoder = {
        var it = JSONDecoder()
        it.keyDecodingStrategy = .convertFromSnakeCase
        return it
    }()

    func getPage(_ page: Int) async throws -> ItemsResponse {
        guard
            let url = URLConstants.makeAPIEndpointPageURL(page: page)
        else {
            throw APIError.urlInstantiationFailed
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let items = try jsonDecoder.decode(ItemsResponse.self, from: data)
        return items
    }
}
