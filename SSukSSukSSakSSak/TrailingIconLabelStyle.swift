//
//  TrailingIconLabelStyle.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/07.
// CardView에서 우리가 원하는 라벨 스타일을 새로 정의 하기 위해
// 텍스트 >> 이미지

import Foundation
import SwiftUI


// LabelStyle은 SwiftUI 프레임워크에서 제공하는 프로토콜.
// import SwiftUI하지 않으면 당연히 ~ 에러가 나게 됨
struct TrailingIconLabelStyle : LabelStyle {
    
    // LabelStyle만 선언했을 때 >> 에러 남
    // 그 이유는 LabelStyle이 필수적으로 가져야하는 makeBody function이 없기 때문
    // makeBody func. >> View를 return 하고, 본문을 나타내는 Body, 그리고 configuration을 이용해 접근함
    
    func makeBody(configuration: Configuration) -> some View {
        
        // 타이틀 >> 이미지 를 기본적으로 제공하는 configuration을 통해 접근
        HStack{
            configuration.title
            configuration.icon
        }
    }
}





