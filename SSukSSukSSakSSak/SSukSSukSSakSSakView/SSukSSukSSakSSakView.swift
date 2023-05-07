//
//  SSukSSukSSakSSakView.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
// 앱의 첫 화면, List 형태로 DailyFight마다 가진 속성들을 뿌려줌

import SwiftUI

struct SSukSSukSSakSSakView: View {
    // 필요한 파라미터는 우리가 보여줄 DailyShower 타입을 원소로 가지는 배열
    @Environment(\.scenePhase) private var scenePhase
    @Binding var showers: [DailyShower]
    @State var isActive = false
    @State var emptyShower : DailyShower = DailyShower.emptyData
    let saveAction: ()->Void
    
    var body: some View {
        NavigationView{
            List {
                ForEach($showers) { $shower in
                    NavigationLink(destination: DetailView(shower: $shower)){
                        CardView(shower:shower)
                    }
                    .listRowBackground(shower.theme.mainColor)
                }
            }
            
            .navigationTitle("Daily Shower")
            .toolbar {
                Button(action:{isActive.toggle()}){
                    Image(systemName: "plus")
                }
            }
            
            
            .sheet(isPresented : $isActive){
                NavigationView{
                    DetailEditView(shower: $emptyShower)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction){
                                Button("Dismiss"){
                                    emptyShower = DailyShower.emptyData
                                    isActive.toggle()
                                    
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                Button("Add"){
                                    showers.append(emptyShower)
                                    emptyShower = DailyShower.emptyData
                                    isActive.toggle()
                                    
                                    
                                }
                            }
                        }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}
struct SSukSSukSSakSSakView_Previews: PreviewProvider {
    static var previews: some View {
        SSukSSukSSakSSakView(showers: .constant(DailyShower.sampleData), saveAction: {})
 
    }
}
