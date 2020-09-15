//
//  UILabel + showTip.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/15/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension UILabel {
    
    func shouldShowTip() {
        
        switch text {
        case "N":
            addToolTip(description: "North", gesture: .doubleTap, isEnabled: true)
            
        case "NbE":
            addToolTip(description: "North by east", gesture: .doubleTap, isEnabled: true)
            
        case "NNE":
            addToolTip(description: "North-northeast", gesture: .doubleTap, isEnabled: true)
            
        case "NEbN":
            addToolTip(description: "Northeast by north", gesture: .doubleTap, isEnabled: true)
            
        case "NE":
            addToolTip(description: "Northeast", gesture: .doubleTap, isEnabled: true)
            
        case "NEbE":
            addToolTip(description: "Northeast by east", gesture: .doubleTap, isEnabled: true)
            
        case "ENE":
            addToolTip(description: "East-northeast", gesture: .doubleTap, isEnabled: true)
            
        case "EbN":
            addToolTip(description: "East by north", gesture: .doubleTap, isEnabled: true)
            
        case "E":
            addToolTip(description: "East", gesture: .doubleTap, isEnabled: true)
            
        case "EbS":
            addToolTip(description: "East by south", gesture: .doubleTap, isEnabled: true)
            
        case "ESE":
            addToolTip(description: "East-southeast", gesture: .doubleTap, isEnabled: true)
            
        case "SEbE":
            addToolTip(description: "Southeast by east", gesture: .doubleTap, isEnabled: true)
            
        case "SE":
            addToolTip(description: "Southeast", gesture: .doubleTap, isEnabled: true)
            
        case "SEbS":
            addToolTip(description: "Southeast by south", gesture: .doubleTap, isEnabled: true)
            
        case "SSE":
            addToolTip(description: "South-southeast", gesture: .doubleTap, isEnabled: true)
            
        case "SbE":
            addToolTip(description: "South by east ", gesture: .doubleTap, isEnabled: true)
            
        case "S":
            addToolTip(description: "South", gesture: .doubleTap, isEnabled: true)
            
        case "SbW":
            addToolTip(description: "South by west", gesture: .doubleTap, isEnabled: true)
            
        case "SSW":
            addToolTip(description: "South-southwest", gesture: .doubleTap, isEnabled: true)
            
        case "SWbS":
            addToolTip(description: "Southwest by south", gesture: .doubleTap, isEnabled: true)
            
        case "SW":
            addToolTip(description: "Southwest", gesture: .doubleTap, isEnabled: true)
            
        case "SWbW":
            addToolTip(description: "Southwest by west", gesture: .doubleTap, isEnabled: true)
            
        case "WSW":
            addToolTip(description: "West-southwest", gesture: .doubleTap, isEnabled: true)
            
        case "WbS":
            addToolTip(description: "West by south", gesture: .doubleTap, isEnabled: true)
            
        case "W":
            addToolTip(description: "West", gesture: .doubleTap, isEnabled: true)
            
        case "WbN":
            addToolTip(description: "West by north", gesture: .doubleTap, isEnabled: true)
            
        case "WNW":
            addToolTip(description: "West-northwest", gesture: .doubleTap, isEnabled: true)
            
        case "NWbW":
            addToolTip(description: "Northwest by west", gesture: .doubleTap, isEnabled: true)
            
        case "NW":
            addToolTip(description: "Northwest", gesture: .doubleTap, isEnabled: true)
            
        case "NWbN":
            addToolTip(description: "Northwest by west", gesture: .doubleTap, isEnabled: true)
            
        case "NNW":
            addToolTip(description: "North-northwest", gesture: .doubleTap, isEnabled: true)
            
        case "NbW":
            addToolTip(description: "North by west", gesture: .doubleTap, isEnabled: true)
        
        default: break
        }
    }
}

