/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_TextField.swift
  Author: Kevin Messina
 Created: Apr 13, 2022
Modified:
 
©2022 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import UIKit
import SwiftUI
//import CurrencyTextField
//import CurrencyFormatter

//struct CurrencyData {
//    var text: String = "0.00"
//    var unformatted: String?
//    var input: Double?
//    var hasFocus: Bool?
//}
//
//final class CurrencyViewModel: ObservableObject {
//    @Published var data = CurrencyData()
//}
//
//struct TextField_Currency: View {
//    var placeholder:String
//    @Binding var viewModelData:CurrencyData
//
//    var body: some View {
//        CurrencyTextField(
//            configuration: .init(
//                placeholder: placeholder,
//                text: $viewModelData.text,
//                unformattedText: $viewModelData.unformatted,
//                inputAmount: $viewModelData.input,
//                hasFocus: $viewModelData.hasFocus,
//                clearsWhenValueIsZero: true,
//                formatter: .default,
//                textFieldConfiguration: { uiTextField in
//                    uiTextField.font = UIFont.preferredFont(forTextStyle: .body)
//                    uiTextField.textColor = .black
//                    uiTextField.keyboardType = .numberPad
//                    uiTextField.layer.masksToBounds = true
//                },
//                onEditingChanged: { isEditing in
//                    if isEditing == false {
//                        viewModelData.text = ""
//                        simPrint(type: .info, msg: "makeCurrencyTextField: clear Text Field")
//                    }
//                },
//                onCommit: {
//                    simPrint(type: .info, msg: "makeCurrencyTextField: onCommit")
//                }
//            )
//        )
//        .disabled(false)
//    }
//}
//
//extension CurrencyFormatter {
//    static let `default`: CurrencyFormatter = {
//        .init {
//            $0.maxValue = 100000000
//            $0.minValue = 0
//            $0.currency = .dollar
//            $0.locale = CurrencyLocale.englishUnitedStates
//            $0.hasDecimals = true
//        }
//    }()
//}
//
