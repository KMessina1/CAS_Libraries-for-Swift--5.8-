/*--------------------------------------------------------------------------------------------------------------------------
    File: extFloatingPoint.swift
  Author: Kevin Messina
 Created: Jan 5, 2020
Modified:
 
©2020-2022 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation

// MARK: - *** Floating Point ***
extension FloatingPoint {
    var whole: Self { modf(self).0 }
    var fraction: Self { modf(self).1 }
}
