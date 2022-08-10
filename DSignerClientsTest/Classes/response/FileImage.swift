//
//  FileImage.swift
//  DSignerClients
//
//  Created by Devel on 14/06/22.
//

import Foundation

// MARK: - FileImage
struct FileImage: Codable {
    let id, pageNumber: Int?
    let fileName: String?
    let fileID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case pageNumber = "PageNumber"
        case fileName = "FileName"
        case fileID = "FileId"
    }
}
