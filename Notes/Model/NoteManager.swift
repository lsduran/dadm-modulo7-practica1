//
//  NoteManager.swift
//  Notes
//
//  Created by Luis Sergio Duran Arenas on 22/09/23.
//

import Foundation

class NoteManager {
    private var notes : [Note] = []
    
    func createNote(note : Note) {
        notes.append(note)
    }
    
    func deleteNote(at index: Int) {
        notes.remove(at: index)
    }
    
    func countNotes() -> Int {
        return notes.count
    }
    
    func getNote(at index: Int) -> Note {
        return notes[index]
    }
    
    func getNotes() -> [Note] {
        return notes
    }
    
    func updateNote(note: Note, at index: Int) {
        // updates a note at specific index
        notes[index] = note
    }
    
    func loadNotes() {
        // loads Notes from File System
        
        let fileManager = FileManager.default
        
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
        
        // Check if file exists
        
        if fileManager.fileExists(atPath: noteUrlPath.relativePath) {
            do {
                
                let jsonData = fileManager.contents(atPath: noteUrlPath.relativePath)
                
                print("json: ", jsonData!)
                
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
                
                // print("Decoded notes: ", notes)
                
            } catch let error {
                
                print("ERROR: Couldn't get data from file ", error)
                
            }
        } else {
            
            print("File doesn't exist at ", noteUrlPath.relativePath)
            
        }
        
    }
    
    func saveNotes() {
        // saves Notes to File System
        
        // set directory to save json file
        let fileManager = FileManager.default
        
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
        
        // add note to json file
        do {
            
            let jsonData = try JSONEncoder().encode(notes)
            
            // print(noteUrlPath.relativePath)
            
            if fileManager.createFile(atPath: noteUrlPath.relativePath, contents: jsonData) {
                print("File created")
            } else {
                print("File not created")
            }
            
        } catch let error {
            
            print("ERROR: couldn't save notes: ", error)
            
        }
    }
}
