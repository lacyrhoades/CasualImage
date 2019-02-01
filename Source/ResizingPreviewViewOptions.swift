//
//  Created by Lacy Rhoades on 8/30/17.
//  Copyright © 2017 Colordeaf. All rights reserved.
//

import Foundation

public enum PreviewFillMode {
    case fit
    case fill
}

public struct ResizingPreviewViewOptions {
    public var fillMode: PreviewFillMode
    public var filter: Filter
    public var aspectRatio: Float
    public var showingTitleSafe: Bool
    public var showing360Experience: Bool
    public var offset: Float
    
    public init(fillMode: PreviewFillMode, filter: Filter, aspectRatio: Float, showingTitleSafe: Bool, showing360Experience: Bool, offset: Float) {
        self.fillMode = fillMode
        self.filter = filter
        self.aspectRatio = aspectRatio
        self.showingTitleSafe = showingTitleSafe
        self.showing360Experience = showing360Experience
        self.offset = offset
    }
}
