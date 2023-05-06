//
//  DetailEditView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/14.
//

import SwiftUI

struct DetailEditView: View {
    
    //    @State var text = ""
    //    @State var lengthInMinutes = 10.0
    //    @State var bodies : [DailyShower.Bodies] = []

    @State var selectedTheme = Theme.lilyPink
    @Binding var shower : DailyShower
    @State var newAttendeeName = ""
    
    
    var body: some View {
        
        // Form-specific styling applies to things like buttons, toggles, labels, lists, and more.
        Form{
            Section(header:Text("Meeting Info")){
                TextField("Title", text: $shower.title)
                // slider 필요
                HStack{
                    Slider(
                        value: $shower.showerTimeInDouble,
                        in:5...30,
                        step: 5
                    )
                    
                    Text("\(shower.showerTime) minutes")
                }
                
                Picker("Shower Color", selection: $selectedTheme){
                    //                    Label("Pink", systemImage: "paintpalette").tag(Theme.lilyPink)
                    //                    Label("Blue", systemImage: "paintpalette").tag(Theme.lilyBlue)
                    //                    Label("Green", systemImage: "paintpalette").tag(Theme.lilyGreen)
                    //                    Label("Yellow", systemImage: "paintpalette").tag(Theme.lilyYellow)
                    //
                    ForEach(Theme.allCases){ theme in
                        Label("\(theme.colorName)", systemImage: "paintpalette").tag(theme)
                    }
                }
            }
 
            
            Section(header: Text("Attendees")){
                // 지금은 Theme이 많이 없고 내가 지정을 해줬지만
                // 추후에 확장성과 코드의 간결함을 위해 ForEach를 사용한다
                // 그러려면 Theme 은 1. allCases를 불러올 수 있어야 하고, 2. Identifiable 해야한다.
                // 그러면 ForEach(Theme.allCases){ theme in
                //      ~~~~ tag.(theme)
                //   }
                // 이렇게 할 수 있을 것 같다
                
                
                ForEach(shower.bodies){ body in
                    Text(body.name)
                }
                .onDelete(){ indices in
                    shower.bodies.remove(atOffsets: indices)
                }
                
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action:{
                        shower.bodies.append(DailyShower.Bodies(name:newAttendeeName))
                        newAttendeeName = ""
                    }){
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(shower:.constant(DailyShower.sampleData[1]))
    }
}
