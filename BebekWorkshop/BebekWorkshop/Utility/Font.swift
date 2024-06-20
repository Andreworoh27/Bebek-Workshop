//
//  FontEnum.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

//enum HostGroteskStyle : String{
//    case Black
//    case BlackItalic
//    case Bold
//    case BoldItalic
//    case Italic
//    case Light
//    case LightItalic
//    case Medium
//    case MediumItalic
//    case Regular
//
//    var font : String{
//        switch self {
//        case .Black:
//            "HostGrotesk-Black"
//        case .BlackItalic:
//            "HostGrotesk-BlackItalic"
//        case .Bold:
//            "HostGrotesk-Bold"
//        case .BoldItalic:
//            "HostGrotesk-BoldItalic"
//        case .Italic:
//            "HostGrotesk-Italic"
//        case .Light:
//            "HostGrotesk-Light"
//        case .LightItalic:
//            "HostGrotesk-LightItalic"
//        case .Medium:
//            "HostGrotesk-Medium"
//        case .MediumItalic:
//            "HostGrotesk-MediumItalic"
//        case .Regular:
//            "HostGrotesk-Regular"
//        }
//    }
//}
//
//enum fontSize : Int{
//    case largeTitle
//    case title1
//    case title2
//    case title3
//    case headline
//    case body
//    case callout
//    case subhead
//    case footnote
//    case caption1
//    case caption2
//
//    var size: Int{
//        switch self {
//        case .largeTitle:
//            34
//        case .title1:
//            28
//        case .title2:
//            22
//        case .title3:
//            20
//        case .headline:
//            17
//        case .body:
//            17
//        case .callout:
//            16
//        case .subhead:
//            15
//        case .footnote:
//            13
//        case .caption1:
//            12
//        case .caption2:
//            11
//        }
//    }
//
//}
//
//extension Font {
//    static func hostGrotesk(style : HostGroteskStyle) -> Font {
//        return Font.custom(HostGroteskStyle.Black.font, size: 20)
//    }
//}


enum HostGroteskFont : String{
    
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
    
    var style : (fontFamily :String, size :CGFloat){
        
        switch self {
        case .largeTitle:
            ("HostGrotesk-Regular",34)
        case .title1:
            ("HostGrotesk-Regular",28)
        case .title2:
            ("HostGrotesk-Regular" ,22)
        case .title3:
            ("HostGrotesk-Regular", 20)
        case .headline:
            ("HostGrotesk-Bold", 17)
        case .body:
            ("HostGrotesk-Regular", 17)
        case .callout:
            ("HostGrotesk-Regular", 16)
        case .subhead:
            ("HostGrotesk-Regular", 15)
        case .footnote:
            ("HostGrotesk-Regular", 13)
        case .caption1:
            ("HostGrotesk-Regular", 12)
        case .caption2:
            ("HostGrotesk-Regular", 11)
        }
    }
}


extension Font {
    static func hostGrotesk(typography : HostGroteskFont) -> Font {
        return Font.custom(typography.style.fontFamily, size: typography.style.size)
    }
}
