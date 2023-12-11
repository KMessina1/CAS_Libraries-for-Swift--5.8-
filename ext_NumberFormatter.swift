/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_NumberFormatter.swift
  Author: Kevin Messina
 Created: Jun 30, 2021
Modified: Apr 13, 2022

©2021-2022 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
 
2022_04_13  - Added example usage.
--------------------------------------------------------------------------------------------------------------------------*/


import Foundation


/// Usage:  let formatter = NumberFormatter().returnDecimalNumberFormatter(decimalPlaces: 2)
///
/// example:   let formatted = NumberFormatter()
///                .returnDecimalNumberFormatter(decimalPlaces: 2)
///                .string(from: NSNumber(value: Double(<Enter String Number>}) ?? 0 ))

extension NumberFormatter {
    func returnDecimalNumberFormatter(decimalPlaces:Int) -> NumberFormatter {
        let formatter:NumberFormatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = decimalPlaces
            formatter.groupingSeparator = Locale.current.groupingSeparator ?? ","
            formatter.usesGroupingSeparator = true
            formatter.groupingSize = 3

        return formatter
    }
}



