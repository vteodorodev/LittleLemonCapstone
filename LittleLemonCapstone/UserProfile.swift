//
//  UserProfile.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 01/09/2024.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    func onPressLogout() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        self.presentation.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
            
            Text("Personal Information").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300, alignment: .center)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
            
            VStack(spacing: 10){
                Text("\(firstName ?? "") \(lastName ?? "")")
                Text(email ?? "")
            }.fontWeight(.semibold)
            
            Spacer()

            Button(action: onPressLogout) {
                Text("Logout")
            }.buttonStyle(YellowButton()).padding()
        }.padding()
    }
}

#Preview {
    UserProfile()
}
