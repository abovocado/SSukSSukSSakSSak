//
//  ShowerIngContentsView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngContentsView: View {
    var shower: DailyShower
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 20)
            .padding()
            .overlay{
                VStack{
                    Text(shower.bodies[0].name)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: "mic")
                        .font(.title)
                        .padding()
                }
                .foregroundColor(shower.theme.accentColor)
        }
    }
}

struct ShowerIngContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngContentsView(shower: DailyShower.sampleData[0])
    }
}
