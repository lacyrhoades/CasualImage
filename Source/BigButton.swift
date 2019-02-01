import UIKit

public class BigButton: UIButton {
    public var hitEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: -50.0, left: -50.0, bottom: -50.0, right: -50.0)
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        return relativeFrame.inset(by: hitEdgeInsets).contains(point)
    }
}
