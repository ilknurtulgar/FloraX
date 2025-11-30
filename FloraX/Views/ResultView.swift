//
//  ResultView.swift
//  FloraX
//
//  Created by İlknur Tulgar on 30.11.2025.
//

import SwiftUI

struct ResultView: View {
    let plant: Plant
    
    var body: some View {
        VStack(spacing: 10){
            Image(uiImage: plant.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text(plant.name)
                .font(.title)
                .bold()
            Text("Doğruluk: \(Int(plant.confidence * 100))%")
            
            if let tips = plant.careTips {
                Text(tips)
            }
        }
        .padding()
    }
}

//#Preview {
   // ResultView(plant:Plant(name: "Basil", confidence: 0.85, image: , careTips: "Bol //güneş ışığı verin.") )
//}
