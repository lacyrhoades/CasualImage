import UIKit

public protocol MenuConfigCell {
    var wellView: UIView {get}
}

extension Style {

    public static var formSubsectionSpace: CGFloat {
        return 12.0
    }

    public static var formSectionSpace: CGFloat {
        return 52.0
    }

    public static var customAccessoryCellFullHeight: CGFloat {
        return 88.0
    }

    public static var customAccessoryCellMinHeight: CGFloat {
        return 52.0
    }

    public static func configPromptHeadingText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 38.0),
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.customDarkGray
        ])
    }

    public static func configMenuButtonText(_ string: String?, inColor color: UIColor = UIColor.customLightGray) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 32.0),
            .paragraphStyle: paragraph,
            .foregroundColor: color
            ])
    }

    public static func configMenuGridText(_ string: String?) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 28.0),
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.customLightGray
            ])
    }

    public static var configOverlayEdgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 24.0, left: 24.0, bottom: 24.0, right: 24.0)
    }

    public static var configOverlayInputInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 34.0, left: 24.0, bottom: 34.0, right: 24.0)
    }

    public static func configPromptText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 22.0),
            .foregroundColor: Style.defaultInterfaceColor
            ])
    }

    public static func configCenteredTitleText(_ string: String?, inColor color: UIColor = UIColor.white) ->NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 22.0),
            .paragraphStyle: paragraph,
            .foregroundColor: color
            ]
        )
    }

    public static func configMenuHeadingText(_ string: String?, inColor color: UIColor = UIColor.white) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 22.0),
            .foregroundColor: color
            ]
        )
    }

    public static func configMenuInactiveHeadingText(_ string: String?) -> NSAttributedString? {
        return Style.configMenuHeadingText(string, inColor: UIColor.darkText)
    }

    public static func floatingToolbarHeadingText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 22.0),
            .foregroundColor: UIColor.white
            ])
    }

    public static func floatingToolbarStatusText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.italicSystemFont(ofSize: 22.0),
            .foregroundColor: UIColor.white
            ])
    }

    public static func configMenuFootnoteText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 18.0),
            .foregroundColor: Style.defaultInterfaceColor
            ])
    }

    public static func configMenuHighlightText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.boldSystemFont(ofSize: 12.0),
            .foregroundColor: UIColor.white
            ])
    }

    public static func configMenuCancelText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.systemFont(ofSize: 22.0),
            .foregroundColor: Style.defaultInterfaceColor
            ])
    }

    public static func configMenuSupportingText(_ string: String?) -> NSAttributedString? {
        return Style.attributedString(string, withAttributes: [
            .font: UIFont.italicSystemFont(ofSize: 18.0),
            .foregroundColor: UIColor.customMenuGray
        ])
    }

    public static var configMenuCellYPadding: CGFloat {
        return 8.0
    }

    public static var configMenuCellXPadding: CGFloat {
        return 14.0
    }

}
