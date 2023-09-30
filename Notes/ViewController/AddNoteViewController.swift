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
    
    var note: Note?
    
    var newNoteFlag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTitle.delegate = self
        noteContent.delegate = self

        if newNoteFlag {
            note?.title = ""
            note?.content = ""
        } else {
            noteTitle.text = note?.title
            noteContent.text = note?.content
        }
        
        
        
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
        
        note = Note(title: noteTitle.text, content: noteContent.text, date: Date())
        
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

}
