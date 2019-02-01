import UIKit

extension Color {
    public var normalizedMaxVals: (CGFloat, CGFloat, CGFloat) {
        let target: Float = 0.99
        return (
            CGFloat(max(0.0, target - self.red)),
            CGFloat(max(0.0, target - self.green)),
            CGFloat(max(0.0, target - self.blue))
        )
    }
    
    public var normalizedGammaVals: (CGFloat, CGFloat, CGFloat) {
        let target: Float = 0.5
        return (
            CGFloat(target/self.red),
            CGFloat(target/self.green),
            CGFloat(target/self.blue)
        )
    }
    
    public var relativePercentageHighlights: String {
        var parts: [String] = []
        
        for color in [("red", red), ("green", green), ("blue", blue)] {
            if color.1 >= 0.001 {
                let val = (-1.0 + color.1) * 100
                let prefix = val > 0 ? "+" : ""
                parts.append(String(format: "%@%.1f%% %@", prefix, val, color.0))
            }
        }
        
        if parts.isEmpty {
            return "Zero"
        }
        
        return parts.joined(separator: ", ")
    }
    
    public var relativePercentageGamma: String {
        let (red, green, blue) = self.normalizedGammaVals
        
        var parts: [String] = []
        
        for color in [("red", red), ("green", green), ("blue", blue)] {
            if color.1 != 1.0 {
                parts.append(String(format: "%.3f %@", color.1, color.0))
            }
        }
        
        if parts.isEmpty {
            return "Zero"
        }
        
        return parts.joined(separator: ", ")
    }
}
