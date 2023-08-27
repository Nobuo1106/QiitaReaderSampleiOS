//
//  Article.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/26.
//

import Foundation

struct Article: Codable {
    var title: String
    var user: User
    var url: String
    var date: String

    enum CodingKeys: String, CodingKey {
        case title
        case user
        case url
        case date = "created_at"
    }
}
