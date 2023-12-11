//
//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_UIView.swift
//   Author: Kevin Messina
//  Created: 2/9/21
// Modified:
// 
// ©2021-2022 Creative App Solutions, LLC. - All Rights Reserved.
//--------------------------------------------------------------------------------------------------------------------------
// NOTES:
//--------------------------------------------------------------------------------------------------------------------------
//

import Foundation
import SwiftUI
import UIKit

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }

    func badge(count: Int = 0, size: CGFloat = 24, offset : CGFloat = 12) -> some View {
        ZStack(alignment: .topTrailing) {
            self

            ZStack {
                if count != 0 {
                    Text("\(count)")
                        .font(.footnote)
                        .frame(width: size, height: size)
                        .background(Circle().fill(Color.red))
                        .animation(nil, value: UUID())
                        .minimumScaleFactor(0.5)
                        .transition(.scale)
                        .foregroundColor(.white)
                }
            }
            .offset(x: offset, y: -offset)
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.currentKeyWindow?.endEditing(true)
    }

    func endEditing() {
        UIApplication.shared.endEditing()
    }
}
#endif
