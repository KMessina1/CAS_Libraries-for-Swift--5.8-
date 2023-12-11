/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_UIApplication.swift
  Author: Kevin Messina
 Created: Jan 25, 2021
Modified: Apr 13, 2022
 
©2021-2022 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
 
2022_04_13  - Added endEditign() functions and condensed many extentions.
--------------------------------------------------------------------------------------------------------------------------*/

import UIKit
import Foundation

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(Self.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }

    func addTapGestureToDismissKeyboardFromAnyView() {
        currentKeyWindow?.endEditing(true)
    }

    func addTapGestureRecognizer() {
        guard
            let window = currentKeyWindow
        else {
            return
        }
        
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        tapGesture.name = "MyTapGesture"
        
        window.addGestureRecognizer(tapGesture)
    }

    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }

    var currentKeyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
    }

    var rootViewController: UIViewController? {
        currentKeyWindow?.rootViewController
    }
}

// MARK: UIApplication: UIGestureRecognizerDelegate
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false // set to `false` if you don't want to detect tap during other gestures
    }
}

