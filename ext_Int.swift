//
//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_Int.swift
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

extension Int {
    var inchesToFeet:Int { return Int(Double(self / 12)) }
    var feetToInches:Int { return self * 12 }
    
    var ouncesToPounds:Int { return self / 16 }
    var poundsToOunces:Int { return self * 16 }
    
    var boolValue:Bool { return (self != 0) }
}

extension BinaryInteger {
    var isEven: Bool { isMultiple(of: 2) }
    var isOdd:  Bool { !isEven }
}
