//
//  RejectFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - RejectFileResponse
struct RejectFileResponse: Codable {
    let code: Int?
    let message: String?
    let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case responseStatus = "ResponseStatus"
    }
}
