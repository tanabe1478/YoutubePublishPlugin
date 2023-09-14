import Foundation


struct YoutubeEmbedGenerator {
    struct Error: LocalizedError {
        var localizedDescription: String
        
        static let invalidURL = Error(localizedDescription: "Failed to construct an URL")
        //static let timeout = Error(localizedDescription: "The request to Twitter's embed API timed out")
    }

    private var config: VideoEmbedConfiguration

    let youtubeURL: URL
    
    init(url: URL, configuration: VideoEmbedConfiguration) {
        self.youtubeURL = url
        self.config = configuration
    }
    
    func generate() -> Result<EmbeddedVideo, Error> {
        //debugPrint("url: \(youtubeURL), config: \(config)")
        guard let components = URLComponents(url: youtubeURL, resolvingAgainstBaseURL: false) else {
            return .failure(.invalidURL)
        }
        
        
        // condition: www.youtube.com
        if let v = components.queryItems?.compactMap ({ $0 }).filter({ $0.name == "v" }).first?.value {
            let htmlCode = html(portal: .youtube, from: v, width: config.width, height: config.height)
            return .success(EmbeddedVideo(width: config.width, height: config.height, html: htmlCode))
        }
        
        // condition: youtu.be/0HHAo1mLgxY
        // https://youtu.be/0HHAo1mLgxY
        guard let host = components.host, host == "youtu.be"  else {
            return .failure(.invalidURL)
        }
        
        let htmlCode = html(portal: .youtube, from: components.path, width: config.width, height: config.height)
        return .success(EmbeddedVideo(width: config.width, height: config.height, html: htmlCode))
    }
}
