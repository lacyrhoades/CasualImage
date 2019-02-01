import UIKit

extension UIScreen {
    // Natural crop size if using the screen as bounds for cropping
    // Constant per device because of how the camera is mounted above the screen
    public var portraitRatio: Float {
        let size = self.bounds.size
        let height = max(size.height, size.width)
        let width = min(size.height, size.width)
        return Float(width / height)
    }
}