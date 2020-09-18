//
//  UILabel + showTip.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/15/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import SwiftyToolTip

extension UILabel  {
    
    func shouldShowTipWithText(_ text: String) {
        self.addToolTip(description: text, gesture: .doubleTap, isEnabled: true)
    }
    
    func shouldShowTip() {
        
        switch text {
            
        case "N": shouldShowTipWithText("North")
            
        case "NbE": shouldShowTipWithText("North by east")
            
        case "NNE": shouldShowTipWithText("North-northeast")
            
        case "NEbN": shouldShowTipWithText("Northeast by north")
            
        case "NE": shouldShowTipWithText("Northeast")
            
        case "NEbE": shouldShowTipWithText("Northeast by east")
            
        case "ENE": shouldShowTipWithText("East-northeast")
            
        case "EbN": shouldShowTipWithText("East by north")
            
        case "E": shouldShowTipWithText("East")
            
        case "EbS": shouldShowTipWithText("East by south")
            
        case "ESE": shouldShowTipWithText("East-southeast")
            
        case "SEbE": shouldShowTipWithText("Southeast by east")
            
        case "SE": shouldShowTipWithText("Southeast")
            
        case "SEbS": shouldShowTipWithText("Southeast by south")
            
        case "SSE": shouldShowTipWithText("South-southeast")
            
        case "SbE": shouldShowTipWithText("South by east")
            
        case "S": shouldShowTipWithText("South")
            
        case "SbW": shouldShowTipWithText("South by west")
            
        case "SSW": shouldShowTipWithText("South-southwest")
            
        case "SWbS": shouldShowTipWithText("Southwest by south")
            
        case "SW": shouldShowTipWithText("Southwest")
            
        case "SWbW": shouldShowTipWithText("Southwest by west")
            
        case "WSW": shouldShowTipWithText("West-southwest")
            
        case "WbS": shouldShowTipWithText("West by south")
            
        case "W": shouldShowTipWithText("West")
            
        case "WbN": shouldShowTipWithText("West by north")
            
        case "WNW": shouldShowTipWithText("West-northwest")
            
        case "NWbW": shouldShowTipWithText("Northwest by west")
            
        case "NW": shouldShowTipWithText("Northwest")
            
        case "NWbN": shouldShowTipWithText("Northwest by west")
            
        case "NNW": shouldShowTipWithText("North-northwest")
            
        case "NbW": shouldShowTipWithText("North by west")
        
        default: break
        }
    }
}

