//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Galih Samudra on 27/07/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            return (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: {
                        LandmarkDetail(landmark: landmark)
                    }, label: {
                        LandmarkRow(landmark: landmark)
                    })
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
