//
//  ShowerIngView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngView: View {
    @Binding var shower: DailyShower
    @StateObject var showerTimer = ShowerTimer()
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(shower.theme.mainColor)
            VStack{
                ShowerIngHeaderView(secondsElapsed: showerTimer.secondsElapsed,
                                    secondsRemaining: showerTimer.secondsRemaining,
                                    theme: shower.theme)
                
                ShowerIngContentsView(shower:shower)
                ShowerIngFooterView(showerers: showerTimer.showerers, skipAction: showerTimer.skipShowerer)
            }
        }
        .padding()
        .onAppear {
            showerTimer.reset(lengthInMinutes: shower.showerTime, bodies: shower.bodies)
            showerTimer.startShower()
        }
        .onDisappear {
            showerTimer.stopShower()
            let newHistory = History(id: UUID(), date: Date(), bodies: shower.bodies)
            shower.history.insert(newHistory, at: 0)
        }
        
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShowerIngView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngView(shower: .constant(DailyShower.sampleData[0]))
    }
}
