//
//  ModelData.swift
//  Landmarks
//
//  Created by Galih Samudra on 27/07/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Could not find file \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: fileURL)
    } catch {
        fatalError("Could not load file \(filename) from in main bundle :\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse data \(filename) as \(T.self) :\n\(error)")
    }
}
