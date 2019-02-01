import Foundation

public struct Size {
    public var width: Float
    public var height: Float
    
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
    public var ratio: Float {
        return width / height
    }
    
    public var flipped: Size {
        return Size(width: height, height: width)
    }
}

