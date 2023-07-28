//
//  Hike.swift
//  Landmarks
//
//  Created by Galih Samudra on 28/07/23.
//
import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()
    var distanceText: String {
        return Self.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Double
    }
}
