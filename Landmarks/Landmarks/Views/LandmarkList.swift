//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Galih Samudra on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks, rowContent: { landmark in
                NavigationLink(destination: {
                    LandmarkDetail()
                }, label: {
                    LandmarkRow(landmark: landmark)
                })
            })
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
