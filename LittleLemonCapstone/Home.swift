//
//  Home.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView{
            Menu()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
            UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil") }
            
        }
        .navigationBarBackButtonHidden(true)
/*        .toolbar {
            ToolbarItem(placement: .principal) {
                SmallLogo()
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
        }*/
    }
}

#Preview {
    Home()
}
