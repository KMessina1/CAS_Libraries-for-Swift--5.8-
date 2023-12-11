/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_Text.swift
  Author: Kevin Messina
 Created: Jan 5, 2020
Modified: May 5, 2020
 
©2020-2022 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI
import UIKit
import AudioToolbox

// MARK: - *** STRING ***
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func textHeightFrom(width: CGFloat, fontName: String, fontSize:CGFloat) -> CGFloat {
        #if os(macOS)
        typealias UXFont = NSFont
        let text: NSTextField = .init(string: self)
        text.font = NSFont.init(name: fontName, size: fontSize)
        #else
        typealias UXFont = UIFont
        let text: UILabel = .init()
        text.text = self
        text.numberOfLines = 0
        #endif
        
        text.font = UXFont.init(name: fontName, size: fontSize)
        text.lineBreakMode = .byWordWrapping
        
        return text.sizeThatFits(CGSize.init(width: width, height: .infinity)).height
    }
}

func limitText(_ stringvar: inout String, length: Int, vibrate:Bool = false) {
    if (stringvar.count > length) {
        stringvar = String(stringvar.prefix(length))
        if vibrate {
            AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) { return }
        }
    }
}

