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
import AVFoundation


class ScanDocViewController: UIViewController,VNDocumentCameraViewControllerDelegate,AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @IBOutlet weak var docImage: UIImageView!
    
    @IBOutlet weak var extractButton: UIButton!
    
    var textRecognitionRequest = VNRecognizeTextRequest()
    
    let session = AVCaptureSession()
    
//    lazy var vision = Vision.vision()
    
//    var barcodeDetector :VisionBarcodeDetector?

    var recognizedText = ""
    
    var extract = false
    
    var myData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let documentCameraViewController = VNDocumentCameraViewController()
        //        documentCameraViewController.delegate = self
        //        self.present(documentCameraViewController, animated: true, completion: nil)
        extract = false
        extractButton.setTitle("Scan", for: .normal)
        
        
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
                view.backgroundColor = .red
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
        if extractButton.title(for: .normal) == "Scan"{
            let documentCameraViewController = VNDocumentCameraViewController()
                       documentCameraViewController.delegate = self
                       self.present(documentCameraViewController, animated: true, completion: nil)
        } else {
       print("extracted")
        }
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
        
        if let image = docImage.image {
            extractButton.setTitle("Extract", for: .normal)
            extractButton.isHidden = false
            extract = true
            
        } else {
            extractButton.setTitle("Scan", for: .normal)
            extractButton.isHidden = false
            extract = false
        }
        
        controller.dismiss(animated: true)
        //        extractViewController.dataExtract = myData
        //        present(extractViewController, animated: true, completion: nil)
        
    }
}

extension ScanDocViewController {
    func startLiveVideo() {
        session.sessionPreset = AVCaptureSession.Preset.photo
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
        let deviceOutput = AVCaptureVideoDataOutput()
        deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
        session.addInput(deviceInput)
        session.addOutput(deviceOutput)
        let imageLayer = AVCaptureVideoPreviewLayer(session: session)
        imageLayer.frame = CGRect(x: 0, y: 0, width: self.docImage.frame.size.width + 100, height: self.docImage.frame.size.height + 250)
        imageLayer.videoGravity = .resizeAspectFill
        docImage.layer.addSublayer(imageLayer)
        session.startRunning()
    }
    
    
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//           if let barcodeDetector = self.barcodeDetector {
//               let visionImage = VisionImage(buffer: sampleBuffer)
//               barcodeDetector.detect(in: visionImage) { (barcodes, error) in
//                   if let error = error {
//                       print(error.localizedDescription)
//                       return
//                   }
//                   if barcodes!.count == 1 {
//                       if (barcodes?.first?.rawValue!.contains("https"))! || (barcodes?.first?.rawValue!.contains("http"))! {
//                           self.website = (barcodes?.first?.rawValue)!
//                           self.QRCodeSetView()
//                           self.Title.isHidden = false
//                           self.textTitle.isHidden = true
//
//                           print("i is here \(self.website)")
//                           
//                           //self.urllink(url: self.website)
//                       } else {
//                           if (barcodes?.first?.rawValue!.count)! > 3 {
//                               self.bar = (barcodes?.first?.rawValue)!
//                               self.fetchProduct(barCode: self.bar)
//                               self.setUpDragableView()
//                               print("i is in second part \(self.bar)")
//                           }
//                       }
//                   }
//               }
//           }
//       }
}
