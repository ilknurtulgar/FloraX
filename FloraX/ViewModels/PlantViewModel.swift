//
//  PlantViewModel.swift
//  FloraX
//
//  Created by İlknur Tulgar on 30.11.2025.
//

import SwiftUI
import Combine
import Vision
import CoreML

class PlantViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var prediction: Plant?
    
    func predictWithVision() {
        guard let image = selectedImage,
              let ciImage = CIImage(image: image) else { return }
        
        guard let model = try? VNCoreMLModel(for: PlantClassifier().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            if let results = request.results as? [VNClassificationObservation],
               let top = results.first {
                
                DispatchQueue.main.async {
                    self?.prediction = Plant(
                        name: top.identifier,
                        confidence: Double(top.confidence),
                        image: image,
                        careTips: nil
                    )
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([request])
        }
    }
}

