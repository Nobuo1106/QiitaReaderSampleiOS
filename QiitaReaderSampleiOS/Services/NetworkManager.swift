//
//  NetworkManager.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/27.
//

import Foundation
import Alamofire

class NetworkManager {

    static let shared = NetworkManager()

    private init() { }

    // ベースURLの組み立て
    private var baseURL: String {
        get {
            if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
               let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
                return dict["BaseUrl"] as? String ?? ""
            }
            return ""
        }
    }

    // ヘッダーの組み立て
    private var headers: HTTPHeaders {
        var header = HTTPHeaders()
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            header["Authorization"] = "Bearer \(dict["ApiToken"] as? String ?? "")"
        }
        return header
    }

    // 記事を取得
    func getArticles(page: Int, perPage: Int, completion: @escaping (Result<[Article], AFError>) -> Void) {
        let url = baseURL + "items"

        let parameters: Parameters = [
            "page": page,
            "per_page": perPage
        ]

        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: [Article].self) { response in
                completion(response.result)
            }
    }
}
