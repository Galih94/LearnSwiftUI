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
    
    // MARK: UIViewControllerRepresentable Interface
    func makeUIViewController(context: Self.Context) -> UIPageViewController {
        let pageViewController =  UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers(
            [context.coordinator.controllers[0]],
            direction: .forward,
            animated: true)
    }
    
    // MARK: Nested Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()
        init(parent: PageViewController) {
            self.parent = parent
            self.controllers = parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        
    }
}
