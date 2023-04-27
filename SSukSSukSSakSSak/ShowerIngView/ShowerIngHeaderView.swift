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
    
    
    var totalTime: Int
    var elaspedSeconds : Int = 60
    var remainingSeconds : Int {
        Int (totalTime - elaspedSeconds)
    }
    
    var progress : Double {
        Double(elaspedSeconds)/Double(totalTime)
    }
    var theme: Theme
   
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(ColoredProgressViewStyle(theme:theme))
 
            HStack{
                VStack (alignment: .leading){
                    Text("Seconds Elasped")
                    Label("\(elaspedSeconds)", systemImage: "hourglass")
                        
                }.font(.caption)
                Spacer()
                VStack (alignment: .trailing){
                    Text("Seconds Remaining")
                    Label("\(remainingSeconds)", systemImage: "hourglass")
                        .labelStyle(.trailingIcon)
                }.font(.caption)
            }
        }.padding()
    }
}

struct ShowerIngHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShowerIngHeaderView(totalTime: 300, theme:.lilyGreen)
    }
}
