//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Galih Samudra on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks, rowContent: { landmark in
            LandmarkRow(landmark: landmark)
        })
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
