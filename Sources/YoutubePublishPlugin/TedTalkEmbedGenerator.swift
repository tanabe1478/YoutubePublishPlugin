//
//  File.swift
//  
//
//  Created by Klaus Kneupner on 02/08/2023.
//
import Foundation


struct TedTalkEmbedGenerator {
    struct Error: LocalizedError {
        var localizedDescription: String
        
        static let invalidURL = Error(localizedDescription: "Failed to construct an URL")
        //static let timeout = Error(localizedDescription: "The request to Twitter's embed API timed out")
    }

    private var config: VideoEmbedConfiguration

    let url: URL
    
    init(url: URL, configuration: VideoEmbedConfiguration) {
        self.url = url
        self.config = configuration
    }
    
    func generate() -> Result<EmbeddedVideo, Error> {
        //debugPrint("url: \(youtubeURL), config: \(config)")
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return .failure(.invalidURL)
        }
        
        
        // condition: contains talks/
        if components.path.starts(with: "/talks/") {
            let htmlCode = html(portal: .ted, from: components.path, width: config.width, height: config.height)
            return .success(EmbeddedVideo(width: config.width, height: config.height, html: htmlCode))
        }
      
            return .failure(.invalidURL)
     
    }
}
