//
//  UIImage+Resources.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import Foundation
import UIKit

extension UIImage {
    public static func uclBackgroundImage() -> UIImage? {
        UIImage(named: "UCL_header")
    }
    
    public static func uelBackgroundImage() -> UIImage? {
        UIImage(named: "UEL_header")
    }
    
    public static func playerAvatar() -> UIImage? {
        UIImage(named: "avatar")
    }
}
