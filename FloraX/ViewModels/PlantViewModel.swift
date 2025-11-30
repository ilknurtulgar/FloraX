//
//  PlantViewModel.swift
//  FloraX
//
//  Created by İlknur Tulgar on 30.11.2025.
//

import SwiftUI
import Combine

class PlantViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var prediction: Plant?
    
    func testPrediction(){
        let image = selectedImage ?? UIImage()
        self.prediction = Plant(name: "Basil", confidence: 0.85, image: image, careTips: "Bol güneş ışığı verin.")
    }
    
}
