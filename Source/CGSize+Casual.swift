import UIKit

extension CGSize {
    public init(_ size: Size) {
        self.init(width: size.width, height: size.height)
    }
    
    public static var resolution240: CGSize {
        return CGSize(width: 320.0, height: 240.0)
    }
    
    public static var resolution480: CGSize {
        return CGSize(width: 640.0, height: 480.0)
    }
    
    public static var resolution32VideoBoundingBox: CGSize {
        return CGSize(width: 1080.0, height: 1080.0)
    }
    
    public static var resolution169MMSVideo: CGSize {
        return CGSize(width: 960.0, height: 540.0)
    }
    
    public static var resolution720p: CGSize {
        return CGSize(width: 1280.0, height: 720.0)
    }
    
    public static var resolution1080p: CGSize {
        return CGSize(width: 1920.0, height: 1080.0)
    }
}
