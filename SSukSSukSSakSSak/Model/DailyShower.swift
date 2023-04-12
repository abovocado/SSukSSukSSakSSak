//
//  DailyShower.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//  보여줄 정보를 담고있는 구조체를 새롭게 정의

import Foundation

// 1. DailyShower를 Card View에 보여주기 위한 객체 생성
struct DailyShower : Identifiable{
    // ShowerView에서 [DailyShower]를 ForEach로 뿌려주기로 결정했기 때문에 >> Identifiable 프로토콜을 따르도록 설정
    // Identifiable,id를 주고
    // UUID 프로토콜인 id 를 위해 생성자에 UUID = UUID()를 주게 됨
    var id:UUID
    var title: String
    var showerTime: Int
    var bodies: [Bodies]
// 2. 색깔 속성을 주기 위한 Theme 객체 정의
    //Theme.swift에서 가질 수 있는 배경색, 액센트 컬러 정의 후 DailyShower라는 구조체가 Theme이라는 속성을 가지도록 추가함.
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, showerTime: Int, bodies: [String], theme: Theme) {
        self.id = id
        self.title = title
        self.showerTime = showerTime
        
        // 생성자 자체는 String Type으로 받고
        // [String].map 을 이용하여 배열 자체를 만져버림
        // .map은 배열을 파라미터로 받고 같은 혹은 다른 형태의 배열 값을 반환함.
        // 여기서는 [String] 을 [Bodies]로 반환하는 것임
        // 내가 한거랑 똑같음
        // 아래에서 Bodies [(name:"Lily"), Bodies(name:"ZzangLily")] 로 했다.
        self.bodies = bodies.map{ Bodies(name: $0) }
        self.theme = theme
    }
}

// 샤워하는 사람들을 ForEach로 뿌려 주고 싶다 << 왜? 몇명일지 모르니까 인덱스로 접근할 수는 없고 배열 크기만큼 각각의 배열 원소에 접근하는 For Each 구문이 필요하기 때문
// 그러려면 bodies는 [String]이 아니라 Identifiable 프로토콜을 따르는 타입을 원소로 하는 배열값이어야 함.
// Identifiable 을 따르는 새로운 타입을 선언하여 bodies에 할당해주고 그 배열을 보여줄 수 있도록 함.
extension DailyShower {
    struct Bodies : Identifiable {
        var id : UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
        
    }
}

// 앱 구성에 필수 요소는 아니지만, view 구성하는 구현 과정에서 Preview에서 보여주는 것을 더 쉽게 하기 위한 초기 값
// Extension >> enumeration, structure, class 에 기능을 추가하기 위함
extension DailyShower {
    // 새로운 기능들 기술
    
    // class overide 가능
    
    
    static let sampleData : [DailyShower] =
    [DailyShower(title: "MiGGulMiGGul", showerTime: 10, bodies: ["Lily", "ZzangLily"], theme: .lilyPink),
     DailyShower(title: "BBoDukBBoDuk", showerTime: 20, bodies: ["Gaon", "ZzanGaon"], theme: .lilyBlue),
     DailyShower(title: "LuLuLaLa", showerTime: 30, bodies: ["Maengu", "Zzangu"], theme: .lilyYellow)
    ]
    
}
