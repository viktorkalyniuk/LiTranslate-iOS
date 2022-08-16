//
//  TranslationParsing.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 15.08.2022.
//

import Foundation

struct TranslationParsing {
    static func parse(text: String, inputLanguage: Languages, outputLanguage: Languages, handler: @escaping(TranslationDecode) -> Void) {
        if let url = URL(string: Links.JSON.libreTranslateURL) {
            let session = URLSession.shared
            let parameters: [String: String] = [
                "q": "\(text)",
                "source": "\(inputLanguage.rawValue)",
                "target": "\(outputLanguage.rawValue)"
            ]

            var request = URLRequest(url: url)

            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }

            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("POST request error: \(error.localizedDescription)")
                    return
                }

                guard let responseData = data else {
                    print("nil Data received from the server")
                    return
                }

                do {
                    let translationDecode: TranslationDecode = try JSONDecoder().decode(TranslationDecode.self, from: responseData)
                    handler(translationDecode)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            if !text.isEmpty {
                task.resume()
            }
        }
    }
}
