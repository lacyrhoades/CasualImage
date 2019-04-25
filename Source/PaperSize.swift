import Foundation

public enum PaperSize: String, Codable, CustomStringConvertible {
    case twoBySix
    case fourBySix
    
    case twoAndHalfBySeven
    case fiveBySeven
    
    public static var safeValues: [PaperSize] {
        return [
            .twoBySix,
            .fourBySix,
            .twoAndHalfBySeven,
            .fiveBySeven
        ]
    }
    
    public static var allValues: [PaperSize] {
        return [
            .twoBySix,
            .fourBySix,
            .twoAndHalfBySeven,
            .fiveBySeven
        ]
    }

    public var description: String {
        switch self {
        case .twoBySix:
            return "2x6"
        case .fourBySix:
            return "4x6"
        case .twoAndHalfBySeven:
            return "2.5x7"
        case .fiveBySeven:
            return "5x7"
        }
    }

    public var ratio: Float {
        switch self {
        case .twoBySix:
            return 2.0/6.0
        case .fourBySix:
            return 4.0/6.0
        case .twoAndHalfBySeven:
            return 3.5/5.0
        case .fiveBySeven:
            return 5.0/7.0
        }
    }

    public var resolution: Size {
        switch self {
        case .twoBySix:
            return Size(width: 1920, height: 640)
        case .fourBySix:
            return Size(width: 1920, height: 1280)
        case .twoAndHalfBySeven:
            return Size(width: 1792, height: 640)
        case .fiveBySeven:
            return Size(width: 1792, height: 1280)
        }
    }
}
