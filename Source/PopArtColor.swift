import Foundation

public struct PopArtColor: Codable {
    public var first: Color
    public var second: Color
    
    public init(first: Color, second: Color) {
        self.first = first
        self.second = second
    }
    
    public static var defaultSet: [PopArtColor] = [
        PopArtColor(first: Color((154/255.0, 99/255.0, 141/255.0)), second: Color((233/255.0, 223/255.0, 122/255.0))),
        PopArtColor(first: Color((215/255.0, 68/255.0, 74/255.0)), second: Color((165/255.0, 210/255.0, 153/255.0))),
        PopArtColor(first: Color((69/255.0, 74/255.0, 174/255.0)), second: Color((171/255.0, 171/255.0, 207/255.0))),
        PopArtColor(first: Color((52/255.0, 15/255.0, 26/255.0)), second: Color((240/255.0, 83/255.0, 129/255.0)))
    ]
}
