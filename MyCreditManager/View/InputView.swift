//
//  InputView.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class InputView {
    func receiveInput() -> String {
        return readLine() ?? ""
    }
}
