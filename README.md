# YoutubePublishPlugin

A plugin for [Publish](https://github.com/JohnSundell/Publish) that let's you easily embed tweets in your posts.

To embed a tweet in your post, use a blockquote in markdown, but add the "youtube" prefix, like so:

```
> youtube https://www.youtube.com/watch?v=Z-VfaG9ZN_U
```

To install the plugin, add it to your site's publishing steps:

```swift
try mysite().publish(using: [
    .installPlugin(.youtube()),
    // ...
])
```
