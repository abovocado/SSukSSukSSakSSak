//
//  ShowerIngFooterView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngFooterView: View {
    var shower: DailyShower
    
    var body: some View {
        HStack{
            Text("Speaker 1 of \(shower.bodies.count)")
            Spacer()
            Button(action: {}){
                Image(systemName: "forward.fill")
                    
            }
        }.foregroundColor(shower.theme.accentColor)
        .padding()
    }
}

struct ShowerIngFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngFooterView(shower: DailyShower.sampleData[0])
    }
}
