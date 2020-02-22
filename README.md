# LogStore

 A tiny package to make log output accessible from within an iOS app.

## Usage

If you project has a `SceneDelegate.swift`, replace `scene(_:willConnectTo:options:)` with the following implementation.

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  guard let scene = (scene as? UIWindowScene) else { return }
  
  #if DEBUG
  let triggerWindow = TriggerWindow(frame: UIScreen.main.bounds)
  triggerWindow.rootViewController = window?.rootViewController
  triggerWindow.windowScene = scene
  triggerWindow.makeKeyAndVisible()
  window = triggerWindow
  #endif
}
```

If you don't have a `SceneDelegate.swift` set the window property in `AppDelegate.swift` to the following line of code.

```swift
var window: UIWindow? = TriggerWindow(frame: UIScreen.main.bounds)
```
