//
//  String + uppercaseLetter.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/16/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
