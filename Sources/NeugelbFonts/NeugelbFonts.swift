import SwiftUI
import UIKit

public struct NeugelbFonts {
    
    public enum FontWeightName: String, CaseIterable {
        case regular = "SuisseIntl"
        case semibold = "SuisseIntl-SemiBold"
        case medium = "SuisseIntl-Medium"
        case bold = "SuisseIntl-Bold"
        case extraBold = "SuisseIntl-Black"
        case light = "SuisseIntl-Light"
    }

    /**
     Returns default `SuisseIntl` font with given weight and size values.
     
     - parameter weight: Fonts weight defined as a `FontWeightName`. The default value is `.regular`
     - parameter size: An `Int` value for size of the font. Usually between 10 and 30.
     - returns: `UIFont`.
     */
    public static func brandingFontWith(weight: FontWeightName = .regular, size: Int) -> UIFont {
        UIFont(name: weight.rawValue, size: CGFloat(size))!
    }

    /**
     Returns default `SuisseIntl` font with given weight and size values.

     - parameter weight: Fonts weight defined as a `FontWeightName`. The default value is `.regular`
     - parameter size: An `Int` value for size of the font. Usually between 10 and 30.
     - returns: `Font`.
     */
    @available(iOS 13.0, *)
    public static func brandingFontWith(weight: FontWeightName = .regular, size: Int) -> Font {
        .custom(weight.rawValue, size: CGFloat(size))
    }
    
    /**
     Registers default font family
     */
    public static func configureFonts() {
        let fileExtension = ".ttf"
        FontWeightName.allCases.forEach {registerFont(fileName: "\($0.rawValue)\(fileExtension)")}
    }

}

// - MARK: Private methods

private extension NeugelbFonts {

    static func registerFont(fileName: String) {
        guard let pathForResourceString = Bundle.module.path(forResource: fileName, ofType: nil),
              let fontData = NSData(contentsOfFile: pathForResourceString),
              let dataProvider = CGDataProvider(data: fontData),
              let fontRef = CGFont(dataProvider) else {
            print("*** [Neugelb] ERROR: Couldn't locate Font files ***")
            return
        }

        var errorRef: Unmanaged<CFError>?

        if !CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) {
            print("*** [Neugelb] ERROR: \(errorRef.debugDescription) ***")
        }
    }
    
}
