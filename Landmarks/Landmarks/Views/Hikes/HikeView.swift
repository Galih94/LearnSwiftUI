//
//  HikeView.swift
//  Landmarks
//
//  Created by Galih Samudra on 28/07/23.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity))
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showdetail = false
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                VStack {
                    Text(hike.name).font(.headline)
                    Text(hike.distanceText)
                }
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 2)) {
                        showdetail.toggle()
                    }
                }, label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showdetail ? 90: 0))
                        .scaleEffect(showdetail ? 1.5 : 1)
                        .padding()
                })
            }
            if showdetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0]).padding()
            Spacer()
        }
    }
}
