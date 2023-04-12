//
//  DetailView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/11.
//

import SwiftUI

struct DetailView: View {
    var shower:DailyShower
    
    var body: some View {
        VStack{
            //Shower Info
            
            List{
                Section(header:Text("Shower Info")){
                    Label("Start Meeting", systemImage: "clock")
                    HStack{
                        Label("Length", systemImage: "timer")
                        Spacer()
                        Text("\(shower.showerTime) Minutes")
                    }
                    
                    HStack{
                        Label("Theme", systemImage: "paintpalette")
                        Spacer()
                        Text(shower.theme.rawValue)
                            .padding(4)
                            .background(shower.theme.mainColor)
                            .foregroundColor(shower.theme.accentColor)
                            .cornerRadius(4)
                    }
                }
                
                Section(header:Text("Bodies")){
                    // 몇 명일지 모르니까 ForEach 구문
                    ForEach(shower.bodies){body in
                        Label(body.name, systemImage: "person")
                    }
                }
                
                Section(header:Text("History")){
                    
                    
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(shower:DailyShower.sampleData[0])
    }
}
