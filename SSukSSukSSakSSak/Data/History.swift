//
//  History.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/05/07.
//

import Foundation


struct History : Identifiable , Codable {
    var id: UUID
    var date: Date
    var bodies: [DailyShower.Bodies]
    
    
    init (id: UUID = UUID(), date: Date = Date(), bodies: [DailyShower.Bodies]){
        self.id = id
        self.date = date
        self.bodies = bodies
    }
}
