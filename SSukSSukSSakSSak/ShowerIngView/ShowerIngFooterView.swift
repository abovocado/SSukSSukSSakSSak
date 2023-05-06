//
//  ShowerIngFooterView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngFooterView: View {
    let showerers: [ShowerTimer.Showerer]
    var skipAction: ()->Void
    
    
    private var showererNumber: Int? {
            guard let index = showerers.firstIndex(where: { !$0.isCompleted }) else { return nil }
            return index + 1
        }
    private var isLastShowerer: Bool {
        return showerers.dropLast().allSatisfy { $0.isCompleted }
        
    }
    
    private var showererText: String {
        guard let showererNumber = showererNumber else { return "No more showerers" }
        return "Showerer \(showererNumber) of \(showerers.count)"
    }
    
    
    var body: some View {
        VStack{
            HStack{
                if isLastShowerer {
                    Text("Last Speaker")
                } else {
                    Text(showererText)
                    Spacer()
                    Button(action: skipAction){
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct ShowerIngFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngFooterView(showerers: DailyShower.sampleData[0].bodies.showerers, skipAction: {})
    }
}
