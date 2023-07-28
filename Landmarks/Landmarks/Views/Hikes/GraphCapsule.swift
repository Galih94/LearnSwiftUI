//
//  GraphCapsule.swift
//  Landmarks
//
//  Created by Galih Samudra on 28/07/23.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat {
        return max(
            CGFloat(magnitude(of: range) / magnitude(of: overallRange) ),
            0.15
        )
    }
    var offsetRatio: CGFloat {
        return CGFloat( (range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double> where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map{ $0.lowerBound }.min()!
    let high = ranges.lazy.map{ $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

            
struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(
            index: 0,
            color: .blue,
            height: 150,
            range: 10..<50,
            overallRange: 0..<100)
    }
}
