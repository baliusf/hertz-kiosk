//
//  FinishViewController.swift
//  HertzKiosk-iPad
//
//  Created by Bali on 23/02/19.
//  Copyright © 2019 Haley Ovenhouse. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
  
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var retryButton: UIButton!
  
  var isSuccess = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupStatusLabel()
  }
  
  private func setupStatusLabel() {
    if isSuccess {
      statusLabel.text = "Success"
      statusLabel.textColor = UIColor.green
    } else {
      statusLabel.text = "Failure"
      statusLabel.textColor = UIColor.red
    }
    
    retryButton.isHidden = isSuccess
  }
  
  @IBAction func homeButtonTapped(_ button: UIButton) {
    navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func retryButtonTapped(_ button: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
}
