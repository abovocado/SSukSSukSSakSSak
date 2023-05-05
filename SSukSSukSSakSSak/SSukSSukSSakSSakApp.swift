//
//  SSukSSukSSakSSakApp.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//

import SwiftUI

@main
struct SSukSSukSSakSSakApp: App {
    @State private var showers = DailyShower.sampleData
    
    
    var body: some Scene {
        WindowGroup {
            SSukSSukSSakSSakView(showers : $showers)
        }
    }
}
