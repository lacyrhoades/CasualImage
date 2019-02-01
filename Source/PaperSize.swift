import Foundation

public enum PaperSize: String, Codable, CustomStringConvertible {
    case fourBySix = "w288h432"
    case fourPointFiveBySix = "w324h432"
    case fourBySixStrips = "w288h432-div2"
    case fiveByFive = "w360h360"
    case fiveBySeven = "w360h504"
    case fiveBySevenStrips = "w360h504-div2"
    case sixBySix = "w432h432"
    case sixByExtra = "w432h576-w432h432_w432h144"
    case sixByEight = "w432h576"
    case sixByEightStrips = "w432h576-div2"
    case sixByEightFourStrips = "w432h576-div4"
    case sixByNine = "w432h648"
    case sixByNineStrips = "w432h648-div2"

    public static var safeValues: [PaperSize] {
        return [
            .fourBySix,
            .fourBySixStrips,
            .fiveBySeven,
            .fiveBySevenStrips
        ]
    }
    
    public static var allValues: [PaperSize] {
        return [
            .fourBySix,
            .fourBySixStrips,
            .fourPointFiveBySix,
            .fiveByFive,
            .fiveBySeven,
            .fiveBySevenStrips,
            .sixBySix,
            .sixByExtra,
            .sixByEight,
            .sixByEightStrips,
            .sixByEightFourStrips,
            .sixByNine,
            .sixByNineStrips
        ]
    }

    public var description: String {
        switch self {
        case .fourBySix:
            return "4x6"
        case .fourPointFiveBySix:
            return "4.5x6"
        case .fourBySixStrips:
            return "4x6 strips (2 copies)"
        case .fiveByFive:
            return "5x5"
        case .fiveBySeven:
            return "5x7"
        case .fiveBySevenStrips:
            return "5x7 strips (2 copies)"
        case .sixBySix:
            return "6x6"
        case .sixByExtra:
            return "6x6 + 2x6 strip"
        case .sixByEight:
            return "6x8"
        case .sixByEightStrips:
            return "6x8 strips (2 copies)"
        case .sixByEightFourStrips:
            return "6x8 strips (4 copies)"
        case .sixByNine:
            return "6x9"
        case .sixByNineStrips:
            return "6x9 strips"
        }
    }

    public var ratio: Float {
        switch self {
        case .fourBySix:
            return 4.0/6.0 / Float(self.repeats)
        case .fourPointFiveBySix:
            return 4.5/6.0 / Float(self.repeats)
        case .fourBySixStrips:
            return 4.0/6.0 / Float(self.repeats)
        case .fiveByFive:
            return 5.0/5.0 / Float(self.repeats)
        case .fiveBySeven:
            return 5.0/7.0 / Float(self.repeats)
        case .fiveBySevenStrips:
            return 5.0/7.0 / Float(self.repeats)
        case .sixBySix:
            return 6.0/6.0 / Float(self.repeats)
        case .sixByExtra:
            return 6.0/8.0
        case .sixByEight:
            return 6.0/8.0 / Float(self.repeats)
        case .sixByEightStrips:
            return 6.0/8.0 / Float(self.repeats)
        case .sixByEightFourStrips:
            return 6.0/8.0 / Float(self.repeats)
        case .sixByNine:
            return 6.0/9.0 / Float(self.repeats)
        case .sixByNineStrips:
            return 6.0/9.0 / Float(self.repeats)
        }
    }

    public var repeats: Int {
        switch self {
        case .fourBySix:
            return 1
        case .fourPointFiveBySix:
            return 1
        case .fourBySixStrips:
            return 2
        case .fiveByFive:
            return 1
        case .fiveBySeven:
            return 1
        case .fiveBySevenStrips:
            return 2
        case .sixBySix:
            return 1
        case .sixByExtra:
            return 1
        case .sixByEight:
            return 1
        case .sixByEightStrips:
            return 2
        case .sixByEightFourStrips:
            return 4
        case .sixByNine:
            return 1
        case .sixByNineStrips:
            return 2
        }
    }

    public var resolution: Size {
        switch self {
        case .fourBySix:
            fallthrough
        case .fourBySixStrips:
            return Size(width: 1920, height: 1280)
        case .fiveBySeven:
            fallthrough
        case .fiveBySevenStrips:
            return Size(width: 1792, height: 1280)
        
        case .fourPointFiveBySix:
            return Size(width: 1920, height: 1280)
        case .fiveByFive:
            return Size(width: 1280, height: 1280)
        case .sixBySix:
            return Size(width: 1920, height: 1920)
        case .sixByExtra:
            return Size(width: 1920, height: 1280)
        case .sixByEight:
            return Size(width: 1920, height: 1280)
        case .sixByEightStrips:
            return Size(width: 1920, height: 1280)
        case .sixByEightFourStrips:
            return Size(width: 1920, height: 1280)
        case .sixByNine:
            return Size(width: 1920, height: 1280)
        case .sixByNineStrips:
            return Size(width: 1920, height: 1280)
        }
    }
}
