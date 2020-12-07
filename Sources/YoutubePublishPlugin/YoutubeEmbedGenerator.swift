import Foundation


struct YoutubeEmbedGenerator {
    struct Error: LocalizedError {
        var localizedDescription: String
        
        static let invalidURL = Error(localizedDescription: "Failed to construct an URL")
        static let timeout = Error(localizedDescription: "The request to Twitter's embed API timed out")
    }

    private var config: YoutubeEmbedConfiguration

    let youtubeURL: URL
    
    init(url: URL, configuration: YoutubeEmbedConfiguration) {
        self.youtubeURL = url
        self.config = configuration
    }
    
    private func html(from v: String) -> String {
        "<div class=\"youtube\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/\(v)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></div>"
    }
    
    func generate() -> Result<EmbeddedYoutube, Error> {
        guard let components = URLComponents(url: youtubeURL, resolvingAgainstBaseURL: false) else {
            return .failure(.invalidURL)
        }
        
        
        // condition: www.youtube.com
        if let v = components.queryItems?.compactMap { $0 }.filter({ $0.name == "v" }).first?.value {
            return .success(EmbeddedYoutube(width: config.width, height: config.height, html: html(from: v)))
        }
        
        // condition: youtu.be/0HHAo1mLgxY
        // https://youtu.be/0HHAo1mLgxY
        guard let host = components.host, host == "youtu.be" else {
            return .failure(.invalidURL)
        }
        
        return .success(EmbeddedYoutube(width: config.width, height: config.height, html: html(from: components.path)))
    }
}
