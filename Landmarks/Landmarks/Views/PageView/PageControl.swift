//
//  PageControl.swift
//  Landmarks
//
//  Created by Galih Samudra on 31/07/23.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(control: self)
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        init(control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
