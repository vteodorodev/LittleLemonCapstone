//
//  Onboarding.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = "Maria"
    @State var lastName: String = "Callas"
    @State var email: String = "mariacallas@gmail.com"
    
    @State var isLoggedIn: Bool = false
    
    func onPressRegister() {
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
            UserDefaults.standard.set(firstName, forKey: kFirstName);
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            isLoggedIn = true
            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
        } else {
            print("Empty fields")
        }
    }
    
    func onAppearOnboarding() {
        if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
            isLoggedIn = true
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Home(),
                    isActive: $isLoggedIn
                ){
                    Text("")
                }
                
                Spacer()
                
                Image("full-logo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300, alignment: .center)
                
                                
                VStack{
                    VStack{
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("First name", text: $firstName)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Colors.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                        )
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("Last name", text: $lastName)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Colors.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                        )

                        HStack {
                            Image(systemName: "at")
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Colors.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                        )

                    }.padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
                    
                    Button(action: onPressRegister) {
                        Text("Register")
                    }.buttonStyle(YellowButton()).padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                }.padding()
            }.onAppear {
                onAppearOnboarding()
            }
            
        }
    }
}

#Preview {
    Onboarding()
}
