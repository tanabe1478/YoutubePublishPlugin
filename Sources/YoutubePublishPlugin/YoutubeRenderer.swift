//
//  YoutubeRenderer.swift
//  
//
//  Created by tanabe.nobuyuki on 2020/12/07.
//

public protocol YoutubeRenderer {
    func render(youtube: EmbeddedYoutube) throws -> String
}

public final class DefaultYoutubeRenderer: YoutubeRenderer{
    public init() {}
    public func render(youtube: EmbeddedYoutube) throws -> String { youtube.html }
}
