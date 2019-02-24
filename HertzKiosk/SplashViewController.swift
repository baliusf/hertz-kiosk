//
//  SplashViewController.swift
//  HertzKiosk
//
//  Created by Haley Ovenhouse on 2/8/19.
//  Copyright © 2019 Haley Ovenhouse. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //segue to the login view after 1.5 seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
      let nav = UINavigationController(rootViewController: homeVC)
      nav.navigationBar.isHidden = true
      self.present(nav, animated: true, completion: nil)
    }
  }
  
}
