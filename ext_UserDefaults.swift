/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_UserDefaults.swift
  Author: Kevin Messina
 Created: 1/25/21
Modified:
 
©2021-2023 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/


import Foundation
import SwiftUI

extension UserDefaults {
    func isKeyPresent(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func color(forKey: String) -> Color? {
        var colorReturned: Color?

        if let colorData = data(forKey: forKey) {
            do {
                if let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSData.self, from: colorData) as? Data {
                
//                if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
                    colorReturned = color.toColor
                }
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: colorForKey", log: logFileFunctionLine())
            }
        }
        return colorReturned
    }

    func setColor(color: Color?, forKey: String) {
        var colorData: NSData?
        let uiColor:UIColor = color!.toUIColor
        
        if color != nil {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: uiColor, requiringSecureCoding: false) as NSData?
                colorData = data
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: setColor", log: logFileFunctionLine())
            }
        }

        set(colorData, forKey: forKey)
    }

    func uiColor(forKey: String) -> UIColor? {
        var colorReturned: UIColor?
        if let colorData = data(forKey: forKey) {
            do {
                if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
                    colorReturned = color
                }
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: uiColorForKey", log: logFileFunctionLine())
            }
        }
        return colorReturned
    }
    
    func setUIColor(color: UIColor?, forKey: String) {
        var colorData: NSData?
        if let color = color {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                colorData = data
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: setUIColor", log: logFileFunctionLine())
            }
        }
        set(colorData, forKey: forKey)
    }

    func date(forKey: String) -> Date? {
        var dateReturned: Date?
        if let dateData = data(forKey: forKey) {
            do {
                if let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dateData) as? Date {
                    dateReturned = data
                }
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: dateForKey", log: logFileFunctionLine())
            }
        }
        return dateReturned
    }
    
    func setDate(date: Date?, forKey: String) {
        var dateData: NSData?
        if date != nil {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: date!, requiringSecureCoding: false) as NSData?
                dateData = data
            } catch {
                simPrint(type: .error, msg: "Error UserDefaults: setDate", log: logFileFunctionLine())
            }
        }
        set(dateData, forKey: forKey)
    }
}
