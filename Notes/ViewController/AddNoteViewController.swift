//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Luis Sergio Duran Arenas on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextView!
    
    @IBOutlet weak var noteContent: UITextView!
    
    @IBOutlet weak var sldFontSizeCtrl: UISlider!
    
    @IBOutlet weak var clrFontColorCtrl: UIColorWell!
    
    var note: Note?
    
    var newNoteFlag: Bool = true
    
    var fontSize = 17.0
    
    var fontColorRGBA = AppConstants.defaultColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTitle.delegate = self
        noteContent.delegate = self

        if newNoteFlag {
            note = Note(title: "", content: "", date: Date(), fontSize: 17.0, fontColor: AppConstants.defaultColor)
        }
        
        sldFontSizeCtrl.value = note!.fontSize
        clrFontColorCtrl.selectedColor = UIColor(red: note!.fontColor[0], green: note!.fontColor[1], blue: note!.fontColor[2], alpha: note!.fontColor[3])
        
        noteTitle.text = note?.title
        noteContent.text = note?.content
        noteContent.font = UIFont.systemFont(ofSize: CGFloat(sldFontSizeCtrl.value))
        noteContent.textColor = clrFontColorCtrl.selectedColor
        
        clrFontColorCtrl.addTarget(self, action: #selector(fontColorChanged), for: .valueChanged)
        
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isModal = self.presentingViewController is UINavigationController
        if isModal {
            self.dismiss(animated: true)
        }
        else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        note = Note(title: noteTitle.text, content: noteContent.text, date: Date(), fontSize: sldFontSizeCtrl.value, fontColor: clrFontColorCtrl.selectedColor!.cgColor.components!)
        
        // HOMEWORK: Add validation
        
        let destination = segue.destination as! NotesTableViewController
        
        destination.note = note
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !validateNote() {
            print("Invalid note")
            return false
        }
        return true
    }
    
    private func validateNote() -> Bool {
        if noteTitle.text.isEmpty {
            noteTitle.borderColor = .red
        }
        
        if noteContent.text.isEmpty {
            noteContent.borderColor = .red
        }
        
        return !noteTitle.text.isEmpty && !noteContent.text.isEmpty
    }
    
    
    @IBAction func fontSizeChanged(_ sender: UISlider) {
        fontSize = CGFloat(sender.value.rounded())
        noteContent.font = UIFont.systemFont(ofSize: fontSize)
    }
    
    @objc func fontColorChanged() {
        fontColorRGBA = (clrFontColorCtrl.selectedColor?.cgColor.components!)!
        noteContent.textColor = clrFontColorCtrl.selectedColor
        // saveConfig(key: "fontColor", value: clrFontColorCtrl.selectedColor?.cgColor.components! ?? AppConstants.defaultColor)
    }

}
