import Foundation

public struct FilterColor: Codable {
    public var red: Float
    public var green: Float
    public var blue: Float

    public static var white = FilterColor(red: 1.0, green: 1.0, blue: 1.0)

    public var description: String {
        return String(format: "%.0f%%/%.0f%%/%.0f%%", floor((1 - red)*100), floor((1 - green)*100), floor((1 - blue)*100))
    }
}

extension FilterColor: Equatable {
    public static func ==(lhs: FilterColor, rhs: FilterColor) -> Bool {
        return lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue
    }
}

extension FilterColor: Hashable {
    public var hashValue: Int {
        return self.red.hashValue
    }
}

extension FilterColor {
    public init(_ color: Color) {
        self.init(red: color.red, green: color.green, blue: color.blue)
    }
    
    public init(_ color: UIColor) {
        let rgb = color.rgb
        self.init(red: Float(rgb.0), green: Float(rgb.1), blue: Float(rgb.2))
    }
}
