//
//  File.swift
//  
//
//  Created by Muhammad Hussaan Saeed on 10/21/21.
//

import UIKit

public enum AppColor {
    case primary
    case secondary
    case background
    case surface
    case error
    case onPrimary
    case onSecondary
    case onBackground
    case onSurface
    case onError
}

public extension UIColor {
    
    static func color(with appColor: AppColor) -> UIColor {
        switch appColor {
        case .primary: return UIColor(hexString: "#5D3EBC")
        case .secondary: return UIColor(hexString: "#FFD10D")
        case .background: return UIColor(hexString: "#f5f5f5")
        case .surface: return UIColor(hexString: "#181818")
        case .error: return UIColor(hexString: "#ff3939")
        case .onPrimary: return UIColor(hexString: "#ffffff")
        case .onSecondary: return UIColor(hexString: "#ffffff")
        case .onBackground: return UIColor(hexString: "#181818")
        case .onSurface: return UIColor(hexString: "#f5f5f5")
        case .onError: return UIColor(hexString: "#ffffff")
        }
    }
    
}


public extension UIColor {
    
    static var primary: UIColor {
        return color(with: .primary)
    }
    
    static var secondary: UIColor {
        return color(with: .secondary)
    }
    
    static var background: UIColor {
        return color(with: .background)
    }
    
    static var surface: UIColor {
        return color(with: .surface)
    }
    
    static var error: UIColor {
        return color(with: .error)
    }
    
    static var onPrimary: UIColor {
        return color(with: .onPrimary)
    }
    
    static var onSecondary: UIColor {
        return color(with: .onSecondary)
    }
    
    static var onBackground: UIColor {
        return color(with: .onBackground)
    }
    
    static var onSurface: UIColor {
        return color(with: .onSurface)
    }
    
    static var onError: UIColor {
        return color(with: .onError)
    }
    
}


public extension UIColor {
    convenience init(hexString: String) {
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let redPart = Int(color >> 16) & mask
        let greenPart = Int(color >> 8) & mask
        let bluePart = Int(color) & mask
        let red   = CGFloat(redPart) / 255.0
        let green = CGFloat(greenPart) / 255.0
        let blue  = CGFloat(bluePart) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
