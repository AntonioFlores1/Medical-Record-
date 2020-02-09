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
    
    @IBOutlet weak var extractButton: UIButton!
    
    
    var textRecognitionRequest = VNRecognizeTextRequest()
    
    var recognizedText = ""
    
    var extract = false
    
    var myData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        self.present(documentCameraViewController, animated: true, completion: nil)
        extract = true
        extractButton.isHidden = true
        
        
        textRecognitionRequest = VNRecognizeTextRequest(completionHandler: { (request, error) in
            if let results = request.results, !results.isEmpty {
                if let requestResults = request.results as? [VNRecognizedTextObservation] {
                    self.recognizedText = ""
                    for observation in requestResults {
                        guard let candidiate = observation.topCandidates(1).first else { return }
                        self.recognizedText += candidiate.string
                        self.recognizedText += "\n"
                    }
                    self.myData = self.recognizedText
                }
            }
        })
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.usesLanguageCorrection = false
        textRecognitionRequest.customWords = ["@gmail.com", "@outlook.com", "@yahoo.com", "@icloud.com"]
    }
    
    
    @IBAction func cams(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            if extract == true {
                extractButton.isHidden = false
                
            } else {
                let documentCameraViewController = VNDocumentCameraViewController()
                documentCameraViewController.delegate = self
                self.present(documentCameraViewController, animated: true, completion: nil)
            }
        case 1:
            view.backgroundColor = .blue
            
        default:
            print("no")
        }
        
    }
    
    
    
    @IBAction func scanButton(_ sender: UIButton) {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        self.present(documentCameraViewController, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        let image = scan.imageOfPage(at: 0)
        
        docImage.image = image
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        do {
            try handler.perform([textRecognitionRequest])
        } catch {
            print(error)
        }
        
        guard let extractViewController = storyboard?.instantiateViewController(identifier:  "extract") as? ExtractViewController else {
            fatalError("Couldn't segue")
        }
        
        
        controller.dismiss(animated: true)
        extractViewController.dataExtract = myData
        present(extractViewController, animated: true, completion: nil)
        
    }
}
