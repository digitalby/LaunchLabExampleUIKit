//
//  NetworkRepository.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import Foundation

protocol NetworkRepository {
    func getPage(_ page: Int) async throws -> ItemsResponse
}
