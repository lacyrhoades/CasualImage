import Foundation

public struct PrintOptions {
    public enum FillMode {
        case fit
        case fill
        
        public var description: String {
            switch self {
            case .fit: return "Fit"
            case .fill: return "Fill"
            }
        }
    }
    
    public enum FrameOrder {
        case normal
        case random
        case backwards
        
        public var description: String {
            switch self {
            case .normal: return "Normal"
            case .random: return "Random"
            case .backwards: return "Backwards"
            }
        }
    }
    
    public var paperSize: PaperSize
    public var frameOrder: FrameOrder = .normal
    public var fillMode: FillMode = .fill
    public var printFrame: PrintFrameOption = .normal
    
    public static var export = PrintOptions(paperSize: .fourBySix)
    
    public init(paperSize: PaperSize) {
        self.paperSize = paperSize
    }
    
    public var isStrips: Bool {
        switch self.paperSize {
        case .fiveBySevenStrips:
            return true
        case .fourBySixStrips:
            return true
        case .sixByNineStrips:
            return true
        case .sixByEightStrips:
            return true
        case .sixByEightFourStrips:
            return true
        default:
            return false
        }
    }
}

public enum PrintFrameOption: CustomStringConvertible {
    case normal
    case first
    case index(Int)
    case last
    
    public static func allValues(upTo: Int) -> [PrintFrameOption] {
        var vals: [PrintFrameOption] = [.normal, .first, .last]
        
        if upTo > 2 {
            for index in 1...upTo {
                vals.append(.index(index))
            }
        }
        
        return vals
    }
    
    public var description: String {
        switch self {
        case .normal:
            return "Full-page singles and grid multiple frames"
        case .first:
            return "Print only the first frame"
        case .last:
            return "Print only the last frame"
        case .index(let index):
            return "Print frame number \(index)"
        }
    }
}

extension PrintFrameOption: Equatable {
    public static func == (lhs: PrintFrameOption, rhs: PrintFrameOption) -> Bool {
        switch (lhs, rhs) {
        case (.index(let leftIndex), .index(let rightIndex)):
            return leftIndex == rightIndex
        case (.normal, .normal):
            return true
        case (.first, .first):
            return true
        case (.last, .last):
            return true
        default:
            return false
        }
    }
}

extension PrintFrameOption: Encodable {
    enum CodingKeys: CodingKey {
        case normal
        case first
        case index
        case last
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .normal:
            try container.encode(true, forKey: .normal)
        case .first:
            try container.encode(true, forKey: .first)
        case .last:
            try container.encode(true, forKey: .last)
        case .index(let index):
            try container.encode(index, forKey: .index)
        }
    }
}

extension PrintFrameOption: Decodable {
    enum CodingError: Error { case decoding(String) }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let _ = try? container.decode(Bool.self, forKey: .normal) {
            self = .normal
            return
        }
        
        if let _ = try? container.decode(Bool.self, forKey: .first) {
            self = .first
            return
        }
        
        if let _ = try? container.decode(Bool.self, forKey: .last) {
            self = .last
            return
        }
        
        if let value = try? container.decode(Int.self, forKey: .index) {
            self = .index(value)
            return
        }
        
        throw PrintFrameOption.CodingError.decoding("Unrecognized value!")
    }
}
