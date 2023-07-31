//
//  PageViewController.swift
//  Landmarks
//
//  Created by Galih Samudra on 31/07/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Self.Context) -> UIPageViewController {
        let pageViewController =  UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])],
            direction: .forward,
            animated: true)
    }
}
