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
                    LandmarkDetail(landmark: landmark)
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
        ForEach(["iPhone SE (3rd generation)", "iPhone 14", "iPhone 14 Pro Max"], id: \.self) { deviceString in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceString))
                .previewDisplayName(deviceString)
        }
    }
}
