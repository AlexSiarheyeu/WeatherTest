//
//  UILabel + Init.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/7/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

enum Font {
    case system(CGFloat)
    case bold(CGFloat)
}

extension UILabel {
    
    func createLabelWith(title: String = "", font: Font, textColor: UIColor = .black) -> UILabel {
        text = title
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        self.textColor = textColor
        
        switch font {
        
        case .system(let size):
            self.font = UIFont.systemFont(ofSize: size)
        case .bold(let size):
            self.font = UIFont.boldSystemFont(ofSize: size)
        }
        
        return self
    }

}
