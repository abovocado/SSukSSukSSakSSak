//
//  CardView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/07.
//

// 첫 화면에서 보여 줄 리스트에 각각 들어갈 요소를 만들어주기 위함.
// 이 요소를 For each 문으로 뿌려주고, 각 shower 의 정보를 받아와서 각각에 맞는 정보를 보여줄 수 있도록 함.
// 여기서 보여주는 정보는 sampleData[0]이다.

import SwiftUI

struct CardView: View {
    var shower:DailyShower
    
    var body: some View {
        VStack(alignment: .leading){
            Text(shower.title)
                .font(.headline)
            Spacer()
            HStack{
                //파라미터를 String 인자로 넘겨줄 때는 \() 무적권 써야 함
                Label("\(shower.bodies.count)", systemImage:"person.3")
                Spacer()
                
                // 기본 라벨 스타일은 이미지 > 텍스트인데 우리는 텍스트 > 이미지를 사용하고 싶음.
                // 새로운 labelStyle 정의 필요
                Label("\(shower.showerTime)", systemImage: "clock")
                // 우리가 직접 정의하고 추가한 TrailingIconLabelStyle을 적용해줌
                // 넣어줬으니까 .trailingIcon으로 접근 가능
                    .labelStyle(.trailingIcon)
            }.font(.caption)
        }
        .padding()
        .foregroundColor(shower.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var shower = DailyShower.sampleData[0]
    static var previews: some View {
        CardView(shower:shower)
            .background(shower.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
