//
//  SSukSSukSSakSSakApp.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//

import SwiftUI

@main
struct SSukSSukSSakSSakApp: App {
    @StateObject private var store = ShowerStore()
    var body: some Scene {
        WindowGroup {
            SSukSSukSSakSSakView(showers : $store.showers){
                Task {
                    do {
                        try await store.save(showers: store.showers)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                    
                }
            }
                .task{
                    do{
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
