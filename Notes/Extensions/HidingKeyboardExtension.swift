//
//  HidingKeyboardExtension.swift
//  ShowCase
//
//  Created by Luis Sergio Duran Arenas on 29/09/23.
//

import Foundation
import UIKit

extension AddNoteViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
