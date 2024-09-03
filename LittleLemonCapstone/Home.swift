//
//  Home.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    @State var selectedTabID: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabID){
            Menu()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem { 
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(0)
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                .tag(1)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left").foregroundStyle(Colors.primaryOne).opacity(selectedTabID == 0 ? 0.0  : 1.0)
                    .onTapGesture {
                        selectedTabID = 0
                    }
            }
            ToolbarItem(placement: .principal) {
                SmallLogo()
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0))
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onChange(of: selectedTabID) { val in
            selectedTabID = val
        }
    }
}

#Preview {
    Home()
}
