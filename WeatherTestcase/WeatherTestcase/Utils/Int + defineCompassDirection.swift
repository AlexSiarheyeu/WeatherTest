//
//  Int + defineCompassDirection.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/14/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

extension Int {

    func toDirection(degree: Int) -> String {
        
       switch degree {
            
       //North
       case 0...5: return "N"
       case 6...16: return "NbE"
       case 16...28: return "NNE"
       case 28...39: return "NEbN"
       case 39...50: return "NE"
       case 50...61: return "NEbE"
       case 61...73: return "ENE"
       case 73...84: return "EbN"
        
       //East
       case 84...95: return "E"
       case 95...106: return "EbS"
       case 106...118: return "ESE"
       case 118...129: return "SEbE"
       case 129...140: return "SE"
       case 140...151: return "SEbS"
       case 151...163: return "SSE"
       case 163...174: return "SbE"
        
       //South
       case 174...185: return "S"
       case 185...196: return "SbW"
       case 196...208: return "SSW"
       case 208...219: return "SWbS"
       case 219...230: return "SW"
       case 230...241: return "SWbW"
       case 241...253: return "WSW"
       case 253...264: return "WbS"
        
       //West
       case 264...275: return "W"
       case 275...286: return "WbN"
       case 286...298: return "WNW"
       case 298...309: return "NWbW"
       case 309...320: return "NW"
       case 320...331: return "NWbN"
       case 331...343: return "NNW"
       case 343...354: return "NbW"
       case 354...360:return "N"
                
       default: return "#"
       }
}
}

