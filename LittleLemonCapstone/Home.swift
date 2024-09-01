//
//  Home.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu().tabItem { Label("Menu", systemImage: "list.dash") }
            UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil") }

        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
