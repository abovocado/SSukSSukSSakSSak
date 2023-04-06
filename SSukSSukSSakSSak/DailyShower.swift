//
//  DailyShower.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//  보여줄 정보를 담고있는 구조체를 새롭게 정의

import Foundation

// 1. DailyShower를 Card View에 보여주기 위한 객체 생성
struct DailyShower {
    var title: String
    var showerTime: Int
    var bodies: [String]
// 2. 색깔 속성을 주기 위한 Theme 객체 정의
    //Theme.swift에서 가질 수 있는 배경색, 액센트 컬러 정의 후 DailyShower라는 구조체가 Theme이라는 속성을 가지도록 추가함.
    var theme: Theme
    
    
}


// 앱 구성에 필수 요소는 아니지만, view 구성하는 구현 과정에서 Preview에서 보여주는 것을 더 쉽게 하기 위한 초기 값
// Extension >> enumeration, structure, class 에 기능을 추가하기 위함
extension DailyShower {
    // 새로운 기능들 기술
    static let sampleData : [DailyShower] =
    [DailyShower(title: "MiGGulMiGGul", showerTime: 10, bodies: ["Lily", "UkDoo"], theme: .lilyPink),
     DailyShower(title: "BBoDukBBoDuk", showerTime: 20, bodies: ["Gaon", "ZzanGaon"], theme: .lilyBlue),
     DailyShower(title: "LuLuLaLa", showerTime: 30, bodies: ["Maengu", "Zzangu"], theme: .lilyYellow)
    ]
    
}
