import Foundation

public struct Filter {
    public static let blank = Filter(name: "blank", style: .color)

    public var name: String
    public var style: FilterStyle

    public var isEnabled: Bool = true

    public var rendersColorResult: Bool = false
    
    public var usesBilateralBlur: Bool = false
    public var bilateralBlurLevel: Float = 17.0
    
    public var usesChromaBlending: Bool = false
    public var chromaPreviewReplacementColor = ChromaKeyColor.defaultPreviewGreen
    public var chromaCaptureReplacementColor = ChromaKeyColor.defaultCaptureGreen

    public private(set) var isPopArt: Bool = false
    public var popArtContrastLevel: Float = 2.8
    public var popArtColors = PopArtColor(first: Color((100/255.0, 100/255.0, 100/255.0)), second: Color((233/255.0, 223/255.0, 122/255.0)))

    public init(name: String, style: FilterStyle) {
        self.name = name
        self.style = style

        switch style {
        case .color:
            self.rendersColorResult = true
        case .colorGlam:
            self.rendersColorResult = true
            self.usesBilateralBlur = true
        case .blackAndWhite:
            break
        case .blackAndWhiteGlam:
            self.usesBilateralBlur = true
        case .popArt:
            self.isPopArt = true
            self.rendersColorResult = true
        case .popArtGlam:
            self.isPopArt = true
            self.rendersColorResult = true
            self.usesBilateralBlur = true
        case .chromaKey:
            self.rendersColorResult = true
            self.usesChromaBlending = true
        case .glamChromaKey:
            self.rendersColorResult = true
            self.usesChromaBlending = true
            self.usesBilateralBlur = true
        case .blackAndWhiteChromaKey:
            self.rendersColorResult = false
            self.usesChromaBlending = true
        case .blackAndWhiteGlamChromaKey:
            self.rendersColorResult = false
            self.usesChromaBlending = true
            self.usesBilateralBlur = true
        }
    }

    public static var allFilters: [Filter] {
        return [
            Filter(name: "color", style: .color),
            Filter(name: "color w/ glam", style: .colorGlam),
            Filter(name: "black & white", style: .blackAndWhite),
            Filter(name: "b&w w/ glam", style: .blackAndWhiteGlam),
            Filter(name: "chroma key", style: .chromaKey),
            Filter(name: "chroma key", style: .glamChromaKey),
            Filter(name: "black and white chroma key", style: .blackAndWhiteChromaKey),
            Filter(name: "black and white chroma key", style: .blackAndWhiteGlamChromaKey),
            Filter(name: "pop art", style: .popArt),
            Filter(name: "pop art w/ glam", style: .popArtGlam)
        ]
    }
}

extension Filter: Hashable, Equatable {
    public var hashValue: Int {
        return self.name.hashValue
    }

    public static func ==(lhs: Filter, rhs: Filter) -> Bool {
        return lhs.name == rhs.name
    }
}
