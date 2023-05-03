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
       
            //Shower Info
        List{
            Section(header:Text("Shower Info")){
                NavigationLink(destination: ShowerIngView(shower:shower)){
                    Label("Start Meeting", systemImage: "clock")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
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
            
            // 추후에 History가 생기면 if 문 생겨서 바꾸고 일단은 No showers Yet
            Section(header:Text("History")){
                Label("No showers yet", systemImage: "calendar.badge.exclamationmark")
            }
        }
        .navigationTitle(shower.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(shower:DailyShower.sampleData[0])
    }
}
