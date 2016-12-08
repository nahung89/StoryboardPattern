//
//  ControllerStoryboardProtocol.swift
//  StoryboardPattern
//
//  Created by NAH on 12/8/16.
//  Copyright © 2016 NAH. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    enum Identifier: String {
        case main = "Main"
        case explore = "Explore"
        case search = "Search"
        case profile = "Profile"
    }
    
    static func name(for controller: UIViewController.Type) -> String? {
        var identifier: Identifier?
        switch controller.className {
        case HomeViewController.className:
            identifier = .main
        case ExploreViewController.className:
            identifier = .explore
        case SearchViewController.className:
            identifier = .search
        case ProfileViewController.className:
            identifier = .profile
        default:
            break
        }
        return identifier?.rawValue
    }
}

extension UIStoryboard {

    static func instanceFromIdentifier(_ identifier: Identifier) -> UIStoryboard {
        return UIStoryboard(name: identifier.rawValue, bundle: Bundle.main)
    }
    
    static func instanceFromName(_ name: String) -> UIStoryboard? {
        guard let identifier = Identifier(rawValue: name) else { return nil }
        return instanceFromIdentifier(identifier)
    }
    
}
