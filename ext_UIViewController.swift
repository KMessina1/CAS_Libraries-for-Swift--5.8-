//
//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_UIViewController.swift
//   Author: Kevin Messina
//  Created: 4/5/21
// Modified:
// 
// ©2021-2022 Creative App Solutions, LLC. - All Rights Reserved.
//--------------------------------------------------------------------------------------------------------------------------
// NOTES:
//--------------------------------------------------------------------------------------------------------------------------
//

import Foundation
import UIKit

extension UIViewController {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes // Get connected scenes
            .filter { $0.activationState == .foregroundActive } // Keep only active scenes, onscreen and visible to the user
            .first(where: { $0 is UIWindowScene }) // Keep only the first `UIWindowScene`
            .flatMap({ $0 as? UIWindowScene })?.windows // Get its associated windows
            .first(where: \.isKeyWindow) // Finally, keep only the key window
    }
    
    static var keyWindowPresentedController: UIViewController? {
        var viewController = keyWindow?.rootViewController
        
        // If root `UIViewController` is a `UITabBarController`
        if let presentedController = viewController as? UITabBarController {
            // Move to selected `UIViewController`
            viewController = presentedController.selectedViewController
        }
        
        // Go deeper to find the last presented `UIViewController`
        while let presentedController = viewController?.presentedViewController {
            // If root `UIViewController` is a `UITabBarController`
            if let presentedController = presentedController as? UITabBarController {
                // Move to selected `UIViewController`
                viewController = presentedController.selectedViewController
            } else {
                // Otherwise, go deeper
                viewController = presentedController
            }
        }
        
        return viewController
    }
    
    /// Top most view controller in view hierarchy
    var topMostViewController: UIViewController {
        // No presented view controller? Current controller is the most view controller
        guard let presentedViewController = self.presentedViewController else {
            return self
        }
        
        // Presenting a navigation controller?
        // Top most view controller is in visible view controller hierarchy
        if let navigation = presentedViewController as? UINavigationController {
            if let visibleController = navigation.visibleViewController {
                return visibleController.topMostViewController
            } else {
                return navigation.topMostViewController
            }
        }
        
        // Presenting a tab bar controller?
        // Top most view controller is in visible view controller hierarchy
        if let tabBar = presentedViewController as? UITabBarController {
            if let selectedTab = tabBar.selectedViewController {
                return selectedTab.topMostViewController
            } else {
                return tabBar.topMostViewController
            }
        }
        
        // Presenting another kind of view controller?
        // Top most view controller is in visible view controller hierarchy
        return presentedViewController.topMostViewController
    }
}

extension UIWindow {
    /// Top most view controller in view hierarchy
    /// - Note: Wrapper to UIViewController.topMostViewController
    var topMostViewController: UIViewController? {
        return self.rootViewController?.topMostViewController
    }
}

