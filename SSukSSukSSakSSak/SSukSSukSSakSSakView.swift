//
//  SSukSSukSSakSSakView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
// 앱의 첫 화면, List 형태로 DailyFight마다 가진 속성들을 뿌려줌

import SwiftUI

struct SSukSSukSSakSSakView: View {
    // 필요한 파라미터는 우리가 보여줄 DailyShower 타입을 원소로 가지는 배열
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
