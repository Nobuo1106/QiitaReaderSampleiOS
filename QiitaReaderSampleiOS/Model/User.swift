//
//  User.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/26.
//

import Foundation

class User: Codable {
    var id: String
    var imgUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case imgUrl = "profile_image_url"
    }
}
