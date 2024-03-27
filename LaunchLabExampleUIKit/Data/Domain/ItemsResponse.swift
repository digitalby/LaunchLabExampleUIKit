//
//  ItemsResponse.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import Foundation

struct ItemsResponse: Codable {
    let items: [Item]
    let totalPages: Int
}
