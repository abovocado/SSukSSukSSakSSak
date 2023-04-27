//
//  ColoredProgressView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/27.
//

import SwiftUI


struct ColoredProgressViewStyle : ProgressViewStyle {
    var theme : Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height:20)
            
            
            ProgressView(configuration)
                .tint(theme.mainColor)
                .frame(height: 12.0)
                .padding(.horizontal)
            
        }
    }
}


struct ColoredProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ColoredProgressViewStyle(theme:.lilyGreen))
            .previewLayout(.sizeThatFits)
    }
}
