import Foundation

protocol LoggerSubscriber {
    func log(namespace: String, message: String, onQueue: String)
    func warn(namespace: String, message: String, onQueue: String)
}

public class Logger {
    public static let shared = Logger()

    public var didError: ((_: String, _: String) -> ())?

    fileprivate let editingQueue = DispatchQueue(label: "LoggerSubscriberEditQueue")
    fileprivate let notificationQueue = DispatchQueue(label: "LoggerNotificationQueue")

    private var subscribers: [LoggerSubscriber] = []
    func addSubscriber(_ subscriber: LoggerSubscriber) {
        self.editingQueue.async {
            self.subscribers.append(subscriber)
        }
    }

    func log(namespace: String, message: String) {
        let queueName = currentQueueName()

        if logignores.contains(namespace) == false {
            let logMessage = String(format:"%@: %@ (%@)", namespace, message, queueName)

            print(logMessage)

            // DebugLogView.shared?.log(logMessage)
        }

        self.notificationQueue.async {
            self.subscribers.forEach({ (eachSubscriber) in
                eachSubscriber.log(namespace: namespace, message: message, onQueue: queueName)
            })
        }
    }

    func warn(_ namespace: String, _ message: String) {
        let queueName = currentQueueName()

        let logMessage = String(format:"%@: %@ (%@)", namespace, message, queueName)

        print(logMessage)

        // DebugLogView.shared?.log(logMessage)

        self.notificationQueue.async {
            self.subscribers.forEach({ (eachSubscriber) in
                eachSubscriber.warn(namespace: namespace, message: message, onQueue: queueName)
            })
        }
    }
}

let logignores: [String] = [
    "Harold",
    "BrainManager",
    "Capture",

//    "Lighthouse",
//
//    "BrainManagerVerbose",
//    "BrainManager Accessory",
//
//    "SlideshowSlide",
//    "SlideshowTransitionCoordinator",
//    "SlideshowViewController",
//    "ScreenWatcher",
//    "SlideshowController",
//    "SessionServer",
//    "SessionBroadcast",

    "ShareWrangler",
//    "ImageUtil",
    "FileUtil",
    
    "PhotoWatcher",
    "Harold",

//    "GalleryVC",
//    "ImageView",
//    "Main menu",
//    "MainMenuVerbose",
//    "CameraCell",
//    "CameraManager",
//    "CameraManagerVerbose",
//    "CameraManagerHacks",
//    "OverlayManager",
//    "ItemViewerVC",
//    "VideoProcessor",
//    "ConfigVC",
//    "ItemViewController",
//    "ShareButtonsVC",
//
//    "ShareLog",
//    "ShareMessageManager",
//    "ShareSettingsManager",
//    "SimpleShareVC",
//
//    "CaptureVC",
//    "AssetSourceManager",
//    "PrinterManager",
//    "CountdownView",
//    "App Delegate",
//    "AtLeastSquareView",
//    "LoadingBarView",
//
//    "EmailMessageServiceManager",
//    "TextMessageServiceManager",
//
//    "LiveCamera",
//
//    "CloudinaryData",
//    "AnimatedImageView",
//    "CastManager",
//    "AssetMap",
//    "DropboxExporter",
//    "JSONPersistable",
"JSONPersistence",
"Purchases",
"FileUtil",
"ImageUtil",
//    "ShareJob",
//    "ShareJobUpload",
//
//    "AssetManager",
//    "AssetFetcher",
//    "AssetFetcher Images",
//    "AppAssetLoader",
//
//    "AppAssetLoader",
//
//    "WebVideoView",
//
//    "AppScanner"
]

public func derror(_ namespace: String, _ message: String) {
    Logger.shared.warn(namespace, message)

    Logger.shared.didError?(namespace, message)
}

public func dwarn(_ namespace: String, _ message: String) {
    #if DEBUG
    Logger.shared.warn(namespace, message)
    #endif
}

public func dl(_ namespace: String, _ message: String) {
    #if DEBUG
    Logger.shared.log(namespace: namespace, message: message)
    #endif
}

var DebugRefTime = Date()

public func debugTime(_ message: String, resetting: Bool = false) {
    #if DEBUG
    if resetting {
        DebugRefTime = Date()
    }
    let timestamp = DebugRefTime.timeIntervalSinceNow * -1.0
    Logger.shared.log(namespace: "Timing", message: "\(timestamp): \(message)")
    #endif
}

public func dropboxError(_ error: Any?) {
    dwarn("Dropbox", error.debugDescription)
}

func currentQueueName() -> String {
    let name = __dispatch_queue_get_label(nil)
    return String(cString: name, encoding: .utf8) ?? "nil"
}
