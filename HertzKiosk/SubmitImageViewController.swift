//
//  SubmitImageViewController.swift
//  HertzKiosk-iPad
//
//  Created by Bali on 24/02/19.
//  Copyright © 2019 Haley Ovenhouse. All rights reserved.
//

import UIKit

class SubmitImageViewController: UIViewController {
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  var photo: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    photoImageView.image = photo
  }
  
  @IBAction func submitButtonTapped(_ button: UIButton) {
    let finishVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
    finishVC.isSuccess = true
    navigationController?.pushViewController(finishVC, animated: true)
  }
  
  @IBAction func retakeButtonTapped(_ button: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
}
