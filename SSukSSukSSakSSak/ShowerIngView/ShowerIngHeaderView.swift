//
//  ShowerIngHeaderView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/22.
//

import SwiftUI

struct ShowerIngHeaderView: View {
    // @State var progress = 0.2
//    var shower:DailyShower
//
//    var totalTime :Int {
//       Int(shower.showerTime)
//    }
//    var elaspedSeconds :Int = 0
//    var remainingSeconds : Int {
//        Int (totalTime - elaspedSeconds)
//    }
    
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var totalSeconds: Int {
            secondsElapsed + secondsRemaining
        }
    
    var progress : Double {
        guard totalSeconds > 0 else {return 1}
        return Double(secondsElapsed)/Double(totalSeconds)
    }
   
    var theme: Theme
    
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(ColoredProgressViewStyle(theme:theme))
 
            HStack{
                VStack (alignment: .leading){
                    Text("Seconds Elasped")
                    Label("\(secondsElapsed)", systemImage: "hourglass")
                        
                }.font(.caption)
                Spacer()
                VStack (alignment: .trailing){
                    Text("Seconds Remaining")
                    Label("\(secondsRemaining)", systemImage: "hourglass")
                        .labelStyle(.trailingIcon)
                }.font(.caption)
            }
            .foregroundColor(theme.accentColor)
        }.padding()
    }
}

struct ShowerIngHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: Theme.lilyGreen)
    }
}
