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
                .frame(height: 300)
                .cornerRadius(20)
                .shadow(radius: 3)
            
            Text(plant.name)
                .font(.title)
                .bold()
                .foregroundColor(.green)
            
            Text("Doğruluk: \(Int(plant.confidence * 100))%")
                .font(.headline)
            
            if let tips = plant.careTips {
                Text(tips)
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sonuç")
     
    }
}

//#Preview {
   // ResultView(plant:Plant(name: "Basil", confidence: 0.85, image: , careTips: "Bol //güneş ışığı verin.") )
//}
