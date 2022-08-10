//
//  SignFileResponse.swift
//  DSignerClients
//
//  Created by Devel on 15/06/22.
//

import Foundation

// MARK: - RejectFileResponse
struct SignFileResponse: Codable {
    let code: Int?
    let message: String?
    let responseStatus: ResponseStatus?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case responseStatus = "ResponseStatus"
    }
}
