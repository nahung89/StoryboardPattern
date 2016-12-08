//
//  BaseViewController.swift
//  StoryboardPattern
//
//  Created by NAH on 12/8/16.
//  Copyright © 2016 NAH. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    static var controllerId: String {
        return String(describing: self) // return slass name, i.e "ExploreViewController"
    }
    
    static func instanceFromStoryboard() -> Self? {
        guard let storyboardName = UIStoryboard.name(for: self) else { return nil }
        return instantiateFrom(storyboardName: storyboardName)
    }
    
    private static func instantiateFrom<VC: UIViewController>(storyboardName: String) -> VC? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controllerId) as? VC
        return controller
    }
}
