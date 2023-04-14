//
//  DetailEditView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/14.
//

import SwiftUI

struct DetailEditView: View {

    @State var text = ""
    @State var lengthInMinutes = 10.0
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
            // Form-specific styling applies to things like buttons, toggles, labels, lists, and more.
            Form{
                Section(header:Text("Meeting Info")){
                    TextField("Title", text:$text)
                    // slider 필요
                    HStack{
                        Slider(
                            value: $lengthInMinutes,
                            in:0...60,
                            step: 1
                            )
                        Text("\(Int(lengthInMinutes)) minutes")
                    }
                    HStack{
                        // Theme Picker 필요
                    }
                }
                
            }
            
            
        }
       
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
