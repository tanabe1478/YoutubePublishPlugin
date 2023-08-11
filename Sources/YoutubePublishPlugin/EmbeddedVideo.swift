//
//  EmbeddedYoutube.swift
//  
//
//  Created by tanabe.nobuyuki on 2020/12/07.
//

import Foundation
public struct EmbeddedVideo: Hashable, Codable {
    public let width: Int
    public let height: Int
    public let html: String
}
