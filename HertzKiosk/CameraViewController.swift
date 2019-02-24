//
//  CameraViewController.swift
//  HertzKiosk-iPad
//
//  Created by Bali on 23/02/19.
//  Copyright © 2019 Haley Ovenhouse. All rights reserved.
//

import UIKit
import LLSimpleCamera

class CameraViewController: UIViewController {
  
  @IBOutlet weak var cameraView: UIView!
  
  var camera: LLSimpleCamera!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setupCamera()
    camera.start()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    camera.stop()
  }
  
  private func setupCamera() {
    camera = LLSimpleCamera.init(quality: AVCaptureSession.Preset.photo.rawValue, position: LLCameraPositionFront, videoEnabled: false)
    camera.attach(to: self, withFrame: cameraView.frame)
    camera.view.frame = cameraView.frame
    camera.fixOrientationAfterCapture = true
    camera.updateFlashMode(LLCameraFlashOff)
    
    camera.onError = { (camera, error) in
      if error != nil {
        camera?.stop()
        DispatchQueue.main.async(execute: {
          self.dismiss(animated: true) { () -> Void in
            let alert = UIAlertController(title: "Camera Error", message: "Please enable camera access in settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.presentingViewController?.present(alert, animated: true, completion: nil)
          }
        })
      }
    }
    
  }
  
  @IBAction func captureButtonTapped(_ button: UIButton) {
    camera.capture({ (camera, image, dictionary, error) -> Void in
      
      if error == nil {
        camera?.stop()
        var capturedImage = image
        if (camera?.position == LLCameraPositionFront) {
          capturedImage = UIImage(cgImage: (capturedImage?.cgImage!)!, scale: (image?.scale)!, orientation: UIImage.Orientation.upMirrored)
        }
        
        self.goToSubmitViewControllerWithImage(capturedImage!)
      }
    }, exactSeenImage: true)
  }
  
  private func goToSubmitViewControllerWithImage(_ image: UIImage) {
    let submitImageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubmitImageViewController") as! SubmitImageViewController
    submitImageVC.photo = image
    navigationController?.pushViewController(submitImageVC, animated: true)
  }
  
}
