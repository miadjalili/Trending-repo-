//
//  APIConstants.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation

class APIConstants {
    static var basedURL: String = "https://api.github.com/search"
    
    enum ServerBaseURL: String {
        case baseURL = "https://api.github.com/search"

    }
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "Authorization"
    case acceptLanguage = "Accept-Language"
    case userAgent = "User-Agent"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwformurlencoded = "application/x-www-form-urlencoded"
}

