//
//  AddNoteViewControllerExtension.swift
//  Notes
//
//  Created by Luis Sergio Duran Arenas on 29/09/23.
//

import Foundation
import UIKit

extension AddNoteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            textView.borderColor = .lightGray
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(textView.text(in: textView.selectedTextRange!)!)
    }
}
