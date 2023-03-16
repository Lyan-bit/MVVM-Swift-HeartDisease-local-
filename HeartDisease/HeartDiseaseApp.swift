//
//  HeartDiseaseApp.swift
//  HeartDisease
//
//  Created by Lyan Alwakeel on 08/11/2022.
//

import SwiftUI

@main
struct HeartDiseaseApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView(model: HeartDiseaseViewModel.getInstance(), classification: ClassificationViewModel.getInstance())
        }
    }
}
