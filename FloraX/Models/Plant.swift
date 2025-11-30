//
//  Plant.swift
//  FloraX
//
//  Created by İlknur Tulgar on 30.11.2025.
//

import SwiftUI

struct Plant: Identifiable {
    let id = UUID()
    let name: String
    let confidence: Double
    let image: UIImage
    let careTips: String?
}
