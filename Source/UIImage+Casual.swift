import CasualUtility

extension UIImage {
    public var imageDoubledForPrinter: UIImage {
        var outputSize = self.size
        
        let ratio = self.ratio
        let dx = self.size.width
        let dy = self.size.height
        
        if ratio <= 1.0 {
            outputSize = CGSize(width: outputSize.width * 2, height: outputSize.height)
        } else {
            outputSize = CGSize(width: outputSize.width, height: outputSize.height * 2)
        }
        
        return ImageRenderUtil.renderer(forSize: outputSize).image(actions: { (context) in
            if ratio <= 1.0 {
                self.draw(at: CGPoint.zero)
                self.draw(at: CGPoint(x: dx, y: 0.0))
            } else {
                self.draw(at: CGPoint.zero)
                self.draw(at: CGPoint(x: 0.0, y: dy))
            }
        })
    }
    
    public static func imageByTilingImages(_ inputImages: [UIImage], withOptions options: PrintOptions) -> UIImage {
        guard inputImages.count > 0 else {
            assert(false, "Cannot tile empty array")
            return UIImage()
        }

        if options.isStrips {
            return UIImage.fourFrameStack(of: inputImages, withOptions: options)
        } else {
            return UIImage.makeGrid(of: inputImages, withOptions: options)
        }
    }

    static func fourFrameStack(of images: [UIImage], withOptions options: PrintOptions) -> UIImage {
        guard !images.isEmpty else {
            assert(false)
            return UIImage()
        }
        
        var images = images
        
        switch options.frameOrder {
        case .normal:
            break
        case .backwards:
            images = images.reversed()
        case .random:
            images = images.shuffled()
        }
        
        if images[0].ratio < 1.0 {
            // portait shaped images
            let outputResolution = options.paperSize.resolution
            return UIImage.tileAcross(images, into: outputResolution, options: options)
        } else {
            // landscape
            let outputResolution = Size(width: options.paperSize.resolution.height, height: options.paperSize.resolution.width)
            return UIImage.tileDown(images, into: outputResolution, options: options)
        }
    }
    
    static func tileDown(_ images: [UIImage], into outputSize: Size, options: PrintOptions) -> UIImage {
        var images = images

        if images.count < 4 {
            images = images.stretched(to: 4)
        }

        images = UIImage.pickSelects(count: 4, fromImages: images)

        let numberColumns = 1
        let numberRows = 4
        
        let cellWidth = CGFloat(outputSize.width) / CGFloat(numberColumns)
        let cellHeight = CGFloat(outputSize.height) / CGFloat(numberRows)
        
        images = images.map {
            switch options.fillMode {
            case .fit:
                return $0.imageInside(ratio: Float(cellWidth / cellHeight), backgroundColor: .white)
            case .fill:
                return $0.centerCroppedTo(ratio: Float(cellWidth / cellHeight))
            }
        }
        
        return ImageRenderUtil.renderer(forSize: CGSize(outputSize)).image(actions: { (context) in
            var x: CGFloat = 0
            var y: CGFloat = 0
            
            images[0].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))
            
            y += cellHeight
            
            images[1].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))
            
            y += cellHeight
            
            images[2].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))
            
            y += cellHeight
            
            images[3].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))
        })
    }
    
    static func tileAcross(_ images: [UIImage], into outputSize: Size, options: PrintOptions) -> UIImage {
        var images = images
        
        if images.count < 4 {
            images = images.stretched(to: 4)
        }
        
        images = UIImage.pickSelects(count: 4, fromImages: images)
        
        let numberColumns = 4
        let numberRows = 1
        
        let cellWidth = CGFloat(outputSize.width) / CGFloat(numberColumns)
        let cellHeight = CGFloat(outputSize.height) / CGFloat(numberRows)
        
        images = images.map {
            switch options.fillMode {
            case .fit:
                return $0.imageInside(ratio: Float(cellWidth / cellHeight), backgroundColor: .white)
            case .fill:
                return $0.centerCroppedTo(ratio: Float(cellWidth / cellHeight))
            }
        }
        
        return ImageRenderUtil.renderer(forSize: CGSize(outputSize)).image(actions: { (context) in
            var x: CGFloat = 0
            var y: CGFloat = 0

            images[0].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))

            x += cellWidth

            images[1].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))

            x += cellWidth

            images[2].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))

            x += cellWidth

            images[3].draw(in: CGRect(x: x, y: y, width: cellWidth, height: cellHeight))
        })
    }

    static func makeGrid(of images: [UIImage], withOptions options: PrintOptions) -> UIImage {
        guard !images.isEmpty else {
            assert(false)
            return UIImage()
        }
        
        var outputResolution = options.paperSize.resolution
        
        if images[0].ratio < 1.0 {
            // Flip this for sake of portrait shaped images
            outputResolution = Size(width: outputResolution.height, height: outputResolution.width)
        }

        var images = images
        
        if images.count < 4 {
            images = images.stretched(to: 4)
        }

        images = UIImage.pickSelects(count: 4, fromImages: images)
        
        switch options.frameOrder {
        case .normal:
            break
        case .backwards:
            images = images.reversed()
        case .random:
            images = images.shuffled()
        }
        
        let halfWidth = ceil(CGFloat(outputResolution.width) / 2.0)
        let halfHeight = ceil(CGFloat(outputResolution.height) / 2.0)
        
        images = images.map {
            switch options.fillMode {
            case .fit:
                return $0.imageInside(ratio: Float(halfWidth / halfHeight), backgroundColor: .white)
            case .fill:
                return $0.centerCroppedTo(ratio: outputResolution.ratio)
            }
        }
        
        let img1 = images[0]
        let img2 = images[1]
        let img3 = images[2]
        let img4 = images[3]

        UIGraphicsBeginImageContextWithOptions(CGSize(outputResolution), false, img1.scale);

        let corner1 = CGRect(x: 0, y: 0, width: halfWidth, height: halfHeight)
        img1.draw(in: corner1)
        let corner2 = CGRect(x: halfWidth, y: 0, width: halfWidth, height: halfHeight)
        img2.draw(in: corner2)
        let corner3 = CGRect(x: 0, y: halfHeight, width: halfWidth, height: halfHeight)
        img3.draw(in: corner3)
        let corner4 = CGRect(x: halfWidth, y: halfHeight, width: halfWidth, height: halfHeight)
        img4.draw(in: corner4)

        let img = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext();

        return img!
    }
}

extension UIImage {
    public func image(byOverlaying text: String) -> UIImage {
        var textSize: TextSize = .extraLarge
        if self.size.width < 2000 {
            textSize = .large
        }
        if self.size.width < 1000 {
            textSize = .medium
        }
        let attributes: [NSAttributedString.Key: Any] = Style.attributes(alignment: .center, size: textSize, color: .white, weight: .medium)
        let string = NSAttributedString(string: text, attributes: attributes)
        let maxHeight: CGFloat = 200.0
        
        let box = string.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: maxHeight), options: .usesLineFragmentOrigin, context: nil)
        
        let margin: CGFloat = 12.0
        let gradientWidth: CGFloat = 48.0
        
        let gradientBox = CGRect(x: self.size.width - gradientWidth - margin, y: margin, width: gradientWidth, height: self.size.height - margin * 2)
        
        let rightTextBackground = CGRect(x: (self.size.width - box.width - margin * 2) / 2.0, y: self.size.height - box.height - margin, width: box.width + margin * 2.0, height: box.height)
        
        let rightTextArea = CGRect(x: (self.size.width - box.width) / 2.0, y: self.size.height - box.height - margin, width: box.width, height: box.height)
        
        return ImageRenderUtil.renderer(forSize: size).image(actions: {
            context in
            self.draw(in: CGRect(size: self.size))
            
            let colors = [UIColor.white.cgColor, UIColor.black.cgColor] as CFArray
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            
            if let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colors, locations: nil) {
                context.cgContext.addRect(gradientBox)
                context.cgContext.clip()
                
                let start = CGPoint(x: gradientBox.midX, y: gradientBox.minY)
                let end = CGPoint(x: gradientBox.midX, y: gradientBox.maxY)
                
                context.cgContext.drawLinearGradient(gradient, start: start, end: end, options: CGGradientDrawingOptions())
                
                context.cgContext.resetClip()
            }

            context.cgContext.setFillColor(UIColor.black.withAlphaComponent(0.65).cgColor)
            context.cgContext.fill(rightTextBackground)
            
            text.draw(with: rightTextArea, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        })
    }
}
