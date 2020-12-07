# YoutubePublishPlugin

A plugin for [Publish](https://github.com/JohnSundell/Publish) that let's you easily embed tweets in your posts.

## Installation

To install it into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(url: "https://github.com/tanabe1478/YoutubePublishPlugin.git", from: "0.1.0")
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

Then import to use it:

```swift
import YoutubePublishPlugin
```

For more information on how to use the Swift Package Manager, check out [its official documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Usage

To embed a youtube in your post, use a blockquote in markdown, but add the "youtube" prefix, like so:

```
> youtube https://www.youtube.com/watch?v=Z-VfaG9ZN_U
```

This plugin supports URLs of the format `https://youtu.be/ZyJwfxqpUXA` and `https://www.youtube.com/watch?v=Z-VfaG9ZN_U`.

To install the plugin, add it to your site's publishing steps:

```swift
try mysite().publish(using: [
    .installPlugin(.youtube()),
    // ...
])
```

## Acknowledgement
Thanks to John Sundell (@johnsundell) for creating [Publish](https://github.com/johnsundell/publish) and SplashPublishPlugin.

Thanks to Guilherme Rambo (@insidegui) for creating the [TwitterPublishPlugin](https://github.com/insidegui/TwitterPublishPlugin) that has been a inspiration for this plugin.


## License

MIT License
