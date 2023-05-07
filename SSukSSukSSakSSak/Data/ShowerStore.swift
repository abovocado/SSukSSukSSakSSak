//
//  ShowerStore.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/05/07.
//


import SwiftUI
import Combine

//Main Thread에서 실행해주세요
@MainActor

// Environment로 ShowersStore 클래스를 사용하기 위해 ObservableObject 프로토콜을 따를 수 있는 class로 구조체를 만들어 줌
class ShowerStore : ObservableObject {
    
    // showers는 변경되면 UI가 responsive하게 Update 되어야 함. 따라서 @Published wrapper을 준다.
    @Published var showers : [DailyShower] = []
    
    
    // fileURL 생성: FileManager를 통해서 "shwoers.data"라는 이름의 파일 경로(url)를 return하는 함수
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        // to return the URL of a file named scrums.data.
        .appendingPathComponent("showers.data")
    }
    
    
    // load (): fileURL()을 통해서 return 받은 url에서 data를 load 하는 함수
    // async : fileURL()이 시행되고 시행되어야 하니깐. 비동기 함수.
    func load() async throws {
        
        
        // [DailyShower]이나 Error가 return 될 수 있도록
        let task = Task<[DailyShower], Error> {
            // access values returned or catch errors thrown from the task.
            // task로부터 리턴 받은 값이나 에러에 접근할 수 있도록 let 상수에 할당
            
            //앞서 우리가 만든 fileURL이라는 함수로 showers.data라는 파일의 url 을 받아옴
            let fileURL = try Self.fileURL()
            
            // 해당하는 url에 있는 Data를 실제로 가져오겠다.
            // 근데 처음 어플을 실행했을 때에는 showers.data가 없겠지?
            // 그럼 빈 Array를 return
            // 결국 data는 어떠한 배열을 저장하고 있을 것이다.
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            // data로 부터 returned 배열을 [] JSONDecoder를 이용하여 [DailyShower] 타입으로 decode 한다.
            let dailyShowers = try JSONDecoder().decode([DailyShower].self, from: data)
            
            // 그 decoded [DailyShower] 가 저장된 dailyShowers가 return 되고 ==> 즉 task에 이 값이 저장되게 됨
            return dailyShowers
            
        }
        
        // task가 반환될 때까지 기다렸다가 showers에 저장
        let decodedShowers = try await task.value
        
        // 즉 저장되어있던 [DailyShower]를 file 경로에서 접근하여 decode하고, load한 배열로 showers : [DailyShower] 룰 업데이트 하게 된다.
        self.showers = decodedShowers
    }
    
    
    func save(showers: [DailyShower]) async throws{
         
        let task = Task {
            let data = try JSONEncoder().encode(showers)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        // _ : task.value의 결과는 관심이 없다~~~
        _ = try await task.value
    }
    
}
