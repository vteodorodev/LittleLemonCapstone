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
        VStack(alignment:.leading) {
            
            Text("Personal Information").font(.karlaCardTitle)
            
            VStack(alignment: .leading, spacing: 15) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Avatar").font(.karlaLabel).foregroundStyle(Color.primary1)
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 80, alignment: .center)
                        .background(.pink)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("First Name")
                        .font(.karlaLabel)
                        .foregroundStyle(Color.primary1)
                    Text("\(firstName ?? "")")
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.primary1, lineWidth:1))
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Last Name")
                        .font(.karlaLabel)
                        .foregroundStyle(Color.primary1)
                    Text("\(lastName ?? "")")
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.primary1, lineWidth:1))
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.karlaLabel)
                        .foregroundStyle(Color.primary1)
                    Text("\(email ?? "")")
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.primary1, lineWidth:1))
                }
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            
            
            Spacer()
            
            Button(action: onPressLogout) {
                Text("Logout")
            }.buttonStyle(YellowButton()).padding()
        }
        .padding()
    }
}

#Preview {
    UserProfile()
}
