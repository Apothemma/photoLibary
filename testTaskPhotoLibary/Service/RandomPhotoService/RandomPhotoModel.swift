//
//  RandomPhotoModel.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import Foundation

struct RandomPhoto: Decodable {
    let created_at: String
    let width: Int
    let height: Int
    let likes: Int
    let user: PhotoUser
    let urls: [URLKing.RawValue: String]

    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct PhotoUser: Decodable {
    let name: String
}


