//
//  UIViewController+Ext.swift
//  StoryboardPattern
//
//  Created by NAH on 12/8/16.
//  Copyright © 2016 NAH. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
