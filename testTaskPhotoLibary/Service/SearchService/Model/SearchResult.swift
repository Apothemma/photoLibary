//
//  SearchResult.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//

import Foundation

struct SearchResult: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let created_at: String
    let width: Int
    let height: Int
    let likes: Int
    let user: User
    let urls: [URLKing.RawValue: String]

    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct User: Decodable {
    let name: String
    let profile_image: [ProfileImage.RawValue: String]

    enum ProfileImage: String {
        case small
        case medium
        case large
    }
}
