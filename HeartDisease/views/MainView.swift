//
//  MainView.swift
//  Diet Pro
//
//  Created by Lyan Alwakeel on 26/09/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model : HeartDiseaseViewModel
    @ObservedObject var classification : ClassificationViewModel
    
    var body: some View {
        TabView {
            CreateHeartDiseaseScreen (model: model).tabItem {
                        Image(systemName: "1.square.fill")
                        Text("+HeartDisease")}
            ListHeartDiseaseScreen (model: model).tabItem {
                        Image(systemName: "2.square.fill")
                        Text("ListHeartDisease")}
            EditHeartDiseaseScreen (model: model).tabItem {
                        Image(systemName: "3.square.fill")
                        Text("EditHeartDisease")}
            DeleteHeartDiseaseScreen (model: model).tabItem {
                        Image(systemName: "4.square.fill")
                        Text("-HeartDisease")}
            SearchHeartDiseaseByAgeageScreen (model: model).tabItem {
                        Image(systemName: "5.square.fill")
                        Text("SearchHeartDiseaseByAgeage")}
            ClassifyHeartDiseaseScreen (model: model, classification: classification).tabItem {
                        Image(systemName: "6.square.fill")
                        Text("ClassifyHeartDisease")} 
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(model: HeartDiseaseViewModel.getInstance(), classification:ClassificationViewModel.getInstance())
    }
}
