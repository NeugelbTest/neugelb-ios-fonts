import Testing
@testable import NeugelbFonts
import SwiftUI
import UIKit

struct NeugelbFontsTests {
    
    @Test
    func testBrandingFontWithUIFont() {
        for weight in NeugelbFonts.FontWeightName.allCases {
            let font: UIFont = NeugelbFonts.brandingFontWith(weight: weight, size: 16)
            #expect(font != nil, "UIFont should not be nil for weight: \(weight.rawValue)")
            #expect(font.fontName == weight.rawValue, "UIFont name should match expected name")
        }
    }
    
    @Test
    @available(iOS 13.0, *)
    func testBrandingFontWithSwiftUIFont() {
        for weight in NeugelbFonts.FontWeightName.allCases {
            let font: Font = NeugelbFonts.brandingFontWith(weight: weight, size: 16)
            #expect(font != nil, "SwiftUI Font should not be nil for weight: \(weight.rawValue)")
        }
    }
    
    @Test
    func testConfigureFonts() {
        NeugelbFonts.configureFonts()
        #expect(true, "configureFonts() executed without crashing")
    }
    
    @Test
    func testFontWeightNames() {
        let expectedWeights: [NeugelbFonts.FontWeightName: String] = [
            .regular: "SuisseIntl",
            .semibold: "SuisseIntl-SemiBold",
            .medium: "SuisseIntl-Medium",
            .bold: "SuisseIntl-Bold",
            .extraBold: "SuisseIntl-Black",
            .light: "SuisseIntl-Light"
        ]
        
        for (weight, expectedName) in expectedWeights {
            #expect(weight.rawValue == expectedName, "Font weight name mismatch for: \(weight)")
        }
    }
}
