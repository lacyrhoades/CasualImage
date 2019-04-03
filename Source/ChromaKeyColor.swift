import UIKit

public struct ChromaKeyColor: Codable {
    public static let defaultPreviewGreen = ChromaKeyColor(red: 0.15, green: 0.73, blue: 0.25)
    public static let defaultCaptureGreen = ChromaKeyColor(red: 0.1, green: 0.73, blue: 0.2)

    public var red: Float
    public var green: Float
    public var blue: Float
    public var threshold: Float
    public var smear: Float

    public var uiColor: UIColor {
        return UIColor(red: CGFloat(self.red), green: CGFloat(self.green), blue: CGFloat(self.blue), alpha: 1.0)
    }

    public init(_ uiColor: UIColor) {
        let (red, green, blue) = uiColor.rgb
        self.init(red: Float(red), green: Float(green), blue: Float(blue))
    }

    public init(red: Float, green: Float, blue: Float) {
        assert(red <= 1)
        assert(green <= 1)
        assert(blue <= 1)
        self.red = red
        self.green = green
        self.blue = blue
        self.threshold = 0.2
        self.smear = 0.1
    }

    public var description: String {
        return String(format: "%.0f/%.0f/%.0f", self.red, self.green, self.blue)
    }
}
