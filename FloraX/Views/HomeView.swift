//
//  HomeView.swift
//  FloraX
//
//  Created by İlknur Tulgar on 30.11.2025.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @StateObject var viewModel = PlantViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var goToResult = false

    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                ZStack{
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .shadow(radius: 3)
                            .frame(height: 300)
                    } else {
                        Rectangle()
                            .fill(Color.green.opacity(0.1))
                            .frame(height: 300)
                            .overlay(Text("Henüz Resim Yok"))
                            .cornerRadius(20)
                    }
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("Galeriden Seç")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color.green)
                        .cornerRadius(15)
                }
                
                Button(action: {
                    viewModel.testPrediction()
                    goToResult = true
                }){
                    Text("Analiz Et")
                        .foregroundColor(.green)
                        .padding()
                        .frame(maxWidth: 150)
                }
                
                if let prediction = viewModel.prediction{
                    NavigationLink(destination: ResultView(plant: prediction),
                                  isActive: $goToResult,
                                   label: {EmptyView()}
                    )
                }
                Spacer()
            }
            .navigationTitle("FloraX")
            .padding()
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        viewModel.selectedImage = uiImage
                    }
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
