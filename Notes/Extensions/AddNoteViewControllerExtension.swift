//
//  AddNoteViewControllerExtension.swift
//  Notes
//
//  Created by Luis Sergio Duran Arenas on 29/09/23.
//

import Foundation
import UIKit

class InputTextViewDelegate: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(textView.text(in: textView.selectedTextRange!)!)
    }
}
