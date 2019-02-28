import UIKit

extension UIColor {
    public static var customPink: UIColor {
        return UIColor(red: 236.0/255.0, green: 29.0/255.0, blue: 68.0/255.0, alpha: 1)
    }
    
    public static var experimentalColor: UIColor {
        return UIColor(red: 69.0/255.0, green: 69.0/255.0, blue: 69.0/255.0, alpha: 1)
    }

    public static var customGray: UIColor {
        return UIColor(red: 68.0/255.0, green: 68.0/255.0, blue: 68.0/255.0, alpha: 1)
    }

    public static var customDarkGray: UIColor {
        return UIColor(red: 28.0/255.0, green: 28.0/255.0, blue: 28.0/255.0, alpha: 1)
    }

    public static var customMediumGray: UIColor {
        return UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1)
    }

    public static var customMenuGray: UIColor {
        return UIColor(red: 141.0/255.0, green: 141.0/255.0, blue: 141.0/255.0, alpha: 1)
    }

    public static var customLightBlue: UIColor {
        return UIColor(red: 112.0/255.0, green: 170.0/255.0, blue: 185.0/255.0, alpha: 1)
    }

    public static var customLightGray: UIColor {
        return UIColor(red: 210.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1)
    }

    public static var customRed: UIColor {
        return UIColor(red: 235.0/255.0, green: 86.0/255.0, blue: 66.0/255.0, alpha: 1)
    }

    public static var customGreen: UIColor {
        return UIColor(red: 85.0/255.0, green: 195.0/255.0, blue: 114.0/255.0, alpha: 1)
    }

    public static var slideshowBrandColor: UIColor {
        return UIColor(red: 76.0/255.0, green: 209.0/255.0, blue: 234.0/255.0, alpha: 1)
    }

    public static var customLinkBlue: UIColor {
        return UIColor(red: 26.0/255.0, green: 133.0/255.0, blue: 1, alpha: 1)
    }

    public func settingRed(_ value: CGFloat) -> UIColor {
        return UIColor(red: value, green: rgb.1, blue: rgb.2, alpha: 1)
    }

    public func settingGreen(_ value: CGFloat) -> UIColor {
        return UIColor(red: rgb.0, green: value, blue: rgb.2, alpha: 1)
    }

    public func settingBlue(_ value: CGFloat) -> UIColor {
        return UIColor(red: rgb.0, green: rgb.1, blue: value, alpha: 1)
    }

    public var rgb: (CGFloat, CGFloat, CGFloat) {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0

        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            return (fRed, fGreen, fBlue)
        } else {
            return (0, 0, 0)
        }
    }

    public var hexString: String {
        let rgb = self.rgb
        return String(format: "#%02X%02X%02X", Int(rgb.0 * 255), Int(rgb.1 * 255), Int(rgb.2 * 255))
    }
}

extension UIColor {
    public convenience init(_ color: ChromaKeyColor) {
        self.init(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: 1.0)
    }
    
    public convenience init(_ color: FilterColor) {
        self.init(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: 1.0)
    }
}

extension UIColor {
    public convenience init(_ color: Color) {
        self.init(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: 1.0)
    }
}

extension UIColor {
    public convenience init(_ vals: (Int, Int, Int)) {
        self.init(red: CGFloat(vals.0) / 255, green: CGFloat(vals.1) / 255, blue: CGFloat(vals.2) / 255, alpha: 1.0)
    }
}
