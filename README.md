# YoutubePublishPlugin

This plugin for [Publish](https://github.com/JohnSundell/Publish) will let you embed YouTube videos and TedTalks in your posts easily.

## Installation

To install this plugin into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(url: "https://github.com/tanabe1478/YoutubePublishPlugin.git", from: "1.0.5")
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "YoutubePublishPlugin"
            ]
        )
    ]
    ...
)
```

And import to use it:

```swift
import YoutubePublishPlugin
```

For more information on how to use the Swift Package Manager, check out [its official documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Usage

You can use Youtube and Ted Talks separately or together. 

### Youtube
To embed a youtube in your post, use a blockquote in markdown, but add the "youtube" prefix, like this:

```
> youtube https://www.youtube.com/watch?v=Z-VfaG9ZN_U
```

This plugin is compatible with `https://youtu.be/ZyJwfxqpUXA` and `https://www.youtube.com/watch?v=Z-VfaG9ZN_U` only.

To install the plugin, add it to your site's publishing steps:

```swift
try mysite().publish(using: [
    .installPlugin(.youtube()),
    // ...
])
```

### Ted Talks
To embed a Ted Talk in your post, use a blockquote in markdown, but add the "tedtalk" prefix, like this:

```
> tedtalk https://www.ted.com/talks/simon_sinek_how_great_leaders_inspire_action
```

To install the plugin, add it to your site's publishing steps:

```swift
try mysite().publish(using: [
    .installPlugin(.tedTalks()),
    // ...
])
```


## Acknowledgement
Thanks to John Sundell (@johnsundell) for creating [Publish](https://github.com/johnsundell/publish) and SplashPublishPlugin.

Thanks to Guilherme Rambo (@insidegui) for creating the [TwitterPublishPlugin](https://github.com/insidegui/TwitterPublishPlugin) that has been a inspiration for this plugin.


## License

MIT License
