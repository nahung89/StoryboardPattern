//
//  HomeViewController.swift
//  StoryboardPattern
//
//  Created by NAH on 12/8/16.
//  Copyright © 2016 NAH. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBAction func goToExplore() {
        guard let controller = ExploreViewController.instanceFromStoryboard() else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func goToSearch() {
        let searchStoryboard = UIStoryboard.instanceFromIdentifier(.search)
        guard let controller = searchStoryboard.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func goToProfile() {
        guard let profileStoryboard = UIStoryboard.instanceFromName("Profile") else { return }
        guard let controller = profileStoryboard.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
