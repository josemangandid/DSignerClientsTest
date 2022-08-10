//
//  GetFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - GetFileResponse
struct GetFileResponse: Codable {
    let fileImages: [FileImage]?
    let code: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case fileImages = "FileImages"
        case code = "Code"
        case message = "Message"
    }
}
