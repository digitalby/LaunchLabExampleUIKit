//
//  URLConstants.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import Foundation

enum URLConstants {
    static let apiEndpointBaseURLString = #"https://3ac2559f1ba549038478ad16f65241cb.api.mockbin.io/"#
    static let apiEndpointPageParam = #"page"#

    static func makeAPIEndpointPageURL(page: Int) -> URL? {
        URL(string: Self.apiEndpointBaseURLString + "?" + apiEndpointPageParam + "=" + String(page))
    }
}
