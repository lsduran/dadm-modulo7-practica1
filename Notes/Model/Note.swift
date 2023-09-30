//
//  Note.swift
//  Notes
//
//  Created by Luis Sergio Duran Arenas on 22/09/23.
//

import Foundation

struct Note : Codable {
    var title : String
    var content : String
    var date : Date
    var fontSize : Float
    var fontColor : [CGFloat]
}
