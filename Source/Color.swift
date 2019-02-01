import Foundation

public struct Color: Codable, Equatable {
    public var red: Float
    public var green: Float
    public var blue: Float
    
    public init(_ components: (Float, Float, Float)) {
        let red = components.0
        let green = components.1
        let blue = components.2
        assert(red <= 1)
        assert(green <= 1)
        assert(blue <= 1)
        self.red = components.0
        self.green = components.1
        self.blue = components.2
    }
    
    public init(red: Float, green: Float, blue: Float) {
        assert(red <= 1)
        assert(green <= 1)
        assert(blue <= 1)
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    public var description: String {
        return String(format: "%.0f%%/%.0f%%/%.0f%%", floor((1 - red)*100), floor((1 - green)*100), floor((1 - blue)*100))
    }
}

extension Color {
    public static let gray = Color((0.5, 0.5, 0.5))
    public static let white = Color((1, 1, 1))
    public static let red = Color((1, 0, 0))
    public static let green = Color((0, 1, 0))
    public static let blue = Color((0, 0, 1))
    public static let customPink = Color((236.0/255.0, 29.0/255.0, 68.0/255.0))
}
