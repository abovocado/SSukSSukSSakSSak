//
//  ShowerIngView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngView: View {
    var shower: DailyShower
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(shower.theme.mainColor)
                .padding()
            VStack{
                ShowerIngHeaderView(totalTime: shower.showerTime, theme:shower.theme)
                    
                ShowerIngContentsView(shower:shower)
                ShowerIngFooterView(shower:shower)
            }.padding()
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct ShowerIngView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngView(shower: DailyShower.sampleData[0])
    }
}
