//
//  Item.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import Foundation

struct Item: Codable {
    let id: String
    let name: String
    let description: String?
    let grade: Grade
}

