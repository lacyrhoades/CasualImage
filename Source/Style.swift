import UIKit

public enum TextSize {
    case small
    case galleryText
    case medium
    case large
    case extraLarge
    case screenSaverBig
}

public class Style {

    // Ideally there's no concept of a default color
    // Yellow to advertize that the library consumer should override this
    public static var defaultInterfaceColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1.0)

    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter
    }()

    public static func attributedString(_ string: String?, withAttributes attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString? {
        guard let string = string else {
            return nil
        }

        var combinedAttributes: [NSAttributedString.Key: Any] = [:]

        attributes?.forEach({ attr in
            combinedAttributes[attr.key] = attr.value
        })

        return NSAttributedString(
            string: string,
            attributes: combinedAttributes
        )
    }

    public static var menuAlpha: CGFloat = 0.7

    public static var configMenuSectionMargin: CGFloat {
        return 18.0
    }

    public static var configMenuMargin: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 158.0
        }

        return 0.0
    }

    public static var configMenuHeaderIndent: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 12.0
        }

        return 12.0
    }

    public static var configMenuEdgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: Style.configMenuMargin, bottom: 0.0, right: Style.configMenuMargin)
    }

    public static var ringsIconImageSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 62.0
        }

        return 42.0
    }

    public static var ringsIconMargin: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 12.0
        }

        return 10.0
    }

    public static var infoCornerRadius: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 15.0
        }

        return 8.0
    }

    public static var dialogCornerRadius: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 8.0
        }

        return 5.0
    }

    public static var dialogTextMargin: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 8.0
        }

        return 5.0
    }

    public static var hudButtonWidth: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 72.0
        }

        return 48.0
    }

    public static var filterInfoTextFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 48.0
        }

        return 28.0
    }

    public static func galleryTimestampText(forDate date: Date) -> NSAttributedString? {
        return Style.text(Style.dateFormatter.string(from: date), alignment: .left, size: .galleryText, color: .white)
    }

    public static var galleryInfoFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 23.0
        }

        return 18.0
    }

    public static var buttonBorderWidth: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 3.0
        }

        return 2.0
    }

    public static var galleryToolbarHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 78.0
        }

        return 52.0
    }

    public static var galleryButtonFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 42.0
        }

        return 28.0
    }

    public static var textTitleFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 68.0
        }

        return 46.0
    }

    public static var boothControlsFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 38.0
        }

        return 26.0
    }

    public static var tapBarFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 84.0
        }

        return 52.0
    }

    public static var interstitialLoadingLabelSize: CGFloat {
        return 132.0
    }

    public static var mainMenuOuterMargin: CGFloat {
        return 8.0
    }
    
    public static var loginPromoHeight: CGFloat {
        return 600
    }

    public static var loginHeroHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 400
        }

        return 400
    }

    public static var tapBarHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            if UIScreen.main.ratio > 3.0/4.0 {
                return 148.0
            }
            
            return 108.0
        }

        return 58.0
    }

    public static var floatingToolbarHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 48.0
        }

        return 38.0
    }

    public static var controlsLogoHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 188.0
        }

        return 138.0
    }

    public static var shareButtonFontSize: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 48.0
        }

        return 36.0
    }

    public static var shareButtonBottomMargin: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 32.0
        }

        return 26.0
    }

    public static var shareButtonSpace: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 14.0
        }

        return 10.0
    }

    public static var shareButtonHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 180.0
        }

        return 120.0
    }

    public static var numericKeypadLabelHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 60.0
        }

        return 48.0
    }

    public static var numericKeypadMargin: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 36.0
        }

        return 32.0
    }

    public static var numericKeypadBackspaceButtonWidth: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 36.0
        }

        return 28.0
    }

    public static var numericKeypadVerticalSpace: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 22.0
        }

        return 18.0
    }

    public static var numericKeypadVerticalOffset: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 12.0
        }

        return 12.0
    }

    public static var keypadButtonHeight: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 116.0
        }

        return 88.0
    }

    public static var keypadButtonSpace: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 14.0
        }

        return 10.0
    }

    public static var mainMenuMargins: CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return 48.0
        }

        return 24.0
    }

    public class func menuLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22.0)
        label.textAlignment = .left
        return label
    }

    public class func deactivatedMenuLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .customMenuGray
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
    }

    public class func menuButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitleColor(Style.defaultInterfaceColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        return button
    }

    public class func imageForColor(_ color: UIColor, alpha: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext();
        context?.setFillColor(color.withAlphaComponent(alpha).cgColor);
        context?.fill(rect);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img!
    }

    public class func lightText(_ text: String?, alignment: NSTextAlignment, size: TextSize) -> NSAttributedString? {
        guard let text = text else {
            return nil
        }
        return Style.text(text, alignment: alignment, size: size, color: .white)
    }

    public class func circleButtonText(_ text: String, _ color: UIColor = Style.defaultInterfaceColor) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        paragraph.lineBreakMode = .byTruncatingTail
        
        let fontSize: CGFloat = UI_USER_INTERFACE_IDIOM() == .pad ? 42.0 : 18.0
        
        return Style.attributedString(text, withAttributes: [
            .font: UIFont.systemFont(ofSize: fontSize, weight: .light),
            .foregroundColor: color,
            .paragraphStyle: paragraph
            ]
        )
    }
    
    public static func add(
        to existingString: NSMutableAttributedString,
        stringList: [String],
                    alignment: NSTextAlignment,
                    size: TextSize,
                    color: UIColor,
                    bullet: String = "\u{2022}",
                    bulletColor: UIColor? = nil,
                    paragraphSpacing: CGFloat = 12,
                    weight: UIFont.Weight = .regular
        ) -> NSAttributedString {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        paragraph.lineBreakMode = .byTruncatingTail
        
        var fontSize: CGFloat
        var indentation: CGFloat
        var lineSpacing: CGFloat
        
        switch size {
        case .small:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 16.0 : 14.0
            indentation = 20.0
            lineSpacing = 1.0
        case .galleryText:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 28.0 : 18.0
            indentation = 20.0
            lineSpacing = 1.0
        case .medium:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 32.0 : 22.0
            indentation = 20.0
            lineSpacing = 1.0
        case .large:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 42.0 : 38.0
            indentation = 20.0
            lineSpacing = 1.0
        case .extraLarge:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 48.0 : 38.0
            indentation = 20.0
            lineSpacing = 1.0
        case .screenSaverBig:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 128.0 : 128.0
            indentation = 20.0
            lineSpacing = 1.0
        }
        
        let font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor ?? color]
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        // paragraphStyle.firstLineHeadIndent = 0
        // paragraphStyle.tailIndent = 1
        
        for string in stringList {
            let formattedString = "\t\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            existingString.append(attributedString)
        }
        
        return existingString
    }
    
    public class func attributes(alignment: NSTextAlignment, size: TextSize, color: UIColor, weight: UIFont.Weight = .regular) -> [NSAttributedString.Key: Any] {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        paragraph.lineBreakMode = .byTruncatingTail
        
        var fontSize: CGFloat
        
        switch size {
        case .small:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 16.0 : 14.0
        case .galleryText:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 28.0 : 18.0
        case .medium:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 32.0 : 22.0
        case .large:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 42.0 : 38.0
        case .extraLarge:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 48.0 : 38.0
        case .screenSaverBig:
            fontSize = UI_USER_INTERFACE_IDIOM() == .pad ? 128.0 : 128.0
        }
        
        let font = UIFont.systemFont(ofSize: fontSize, weight: weight)

        return [
            .font: font,
            .foregroundColor: color,
            .paragraphStyle: paragraph
        ]
    }
    
    public class func text(_ text: String, alignment: NSTextAlignment, size: TextSize, color: UIColor, weight: UIFont.Weight = .regular) -> NSAttributedString? {
        
        return Style.attributedString(text, withAttributes: Style.attributes(alignment: alignment, size: size, color: color, weight: weight))
    }
    
    public static var menuBlurEffectStyle: UIBlurEffect.Style {
        if #available(iOS 13.0, *) {
            switch UITraitCollection.current.userInterfaceStyle {
            case .dark:
                return UIBlurEffect.Style.dark
            default:
                return UIBlurEffect.Style.extraLight
            }
        } else {
            return UIBlurEffect.Style.extraLight
        }
    }
}
