//
//  UIFont+Extension.swift
//  qpyf
//
//  Created by zq on 2023/3/3.
//

import UIKit

extension UIFont{
    class func semibold(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .semibold)
    }
    
    class func bold(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .bold)
    }
    
    class func light(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .light)
    }
    
    class func medium(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .medium)
    }
    
    class func regular(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .regular)
    }
    
    class func heavy(_ font: CGFloat)-> UIFont {
        return self.systemFont(ofSize: font, weight: .heavy)
    }
}
