//
//  ScanDocViewController.swift
//  Medical Records
//
//  Created by antonio  on 2/8/20.
//  Copyright © 2020 antonio . All rights reserved.
//

import UIKit
import VisionKit
import Vision


class ScanDocViewController: UIViewController,VNDocumentCameraViewControllerDelegate {
    
    @IBOutlet weak var docImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func scanButton(_ sender: UIButton) {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        self.present(documentCameraViewController, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        let image = scan.imageOfPage(at: 0)
        
        docImage.image = image
        
//        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
//        do {
////            try handler.perform([textRecognitionRequest])
//        } catch {
//            print(error)
//        }
        controller.dismiss(animated: true)
    }
}
