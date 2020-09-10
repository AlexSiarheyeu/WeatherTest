//
//  UIImageView + CustomSettings.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/7/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func createImageViewWith(imageNamed: String) -> UIImageView {
        translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: imageNamed)
        return self
    }
    
    

}
