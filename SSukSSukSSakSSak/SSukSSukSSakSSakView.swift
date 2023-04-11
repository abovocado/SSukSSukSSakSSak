//
//  SSukSSukSSakSSakView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//

import SwiftUI

struct SSukSSukSSakSSakView: View {
    var showers: [DailyShower]
    var body: some View {
        List{
            ForEach(showers) { shower in
                CardView(shower:shower)
                    .listRowBackground(shower.theme.mainColor)
            }
        }
    }
}

struct SSukSSukSSakSSakView_Previews: PreviewProvider {
    static var previews: some View {
        SSukSSukSSakSSakView(showers: DailyShower.sampleData)
    }
}
