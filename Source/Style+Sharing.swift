import UIKit

extension Style {
    public static func countdownLabelText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 268.0),
            .foregroundColor: Style.defaultUIColor,
            .paragraphStyle: paragraph,
            ])
    }

    public static var messageLabelLargeFontSize: CGFloat {
        return 168.0
    }

    public static var messageLabelSmallFontSize: CGFloat {
        return 102.0
    }

    public static func messageLabelText(_ string: String, color: UIColor) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        paragraph.lineHeightMultiple = 0.8
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: Style.messageLabelLargeFontSize),
            .foregroundColor: color,
            .paragraphStyle: paragraph,
            ])
    }

    
    public static func settingsTitleText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 32.0, weight: .heavy),
            .foregroundColor: UIColor.customMediumGray,
            .paragraphStyle: paragraph
            ])
    }

    public static func settingsButtonText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 36.0, weight: .light),
            .foregroundColor: UIColor.customMediumGray
            ])
    }

    public static func settingsButtonFinalText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 36.0, weight: .light),
            .foregroundColor: UIColor.customPink
            ])
    }

    public static func settingsButtonDestructiveText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 36.0, weight: .light),
            .foregroundColor: UIColor.white
            ])
    }

    public static func headlineText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 48.0),
            .foregroundColor: UIColor.white
            ])
    }

    public static func darkHeadlineText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 48.0),
            .foregroundColor: UIColor.customDarkGray
            ])
    }

    public static func centeredDarkHeadlineText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 48.0),
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.customDarkGray
            ])
    }

    public static func centeredLightHeadlineText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 48.0),
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.lightText
            ])
    }

    public static func shareButtonText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 28.0),
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.white
            ])
    }
}
