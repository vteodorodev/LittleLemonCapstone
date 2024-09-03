//
//  Onboarding.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

let kFirstName = "first name key"
let kPhoneNumber = "phone number key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = "Maria"
    @State var phoneNumber: String = "333-333-333"
    @State var email: String = "mariacallas@gmail.com"
    
    @State var isLoggedIn: Bool = false
    
    func onPressRegister() {
        if !firstName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty {
            UserDefaults.standard.set(firstName, forKey: kFirstName);
            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
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
                
                VStack(alignment: .leading) {
                    Text("Little Lemon Menu")
                        .font(.markaziTitle)
                        .foregroundStyle(Colors.primaryTwo)
                        .lineSpacing(0)
                    VStack(alignment: .leading) {
                        Text("Chicago")
                            .font(.markaziSubtitle)
                            .foregroundStyle(Colors.white)
                        HStack {
                            Text("We are a family owned mediterranean restaurant, focused on traditional recipes served with a modern twist.").font(.karlaLeadText).foregroundStyle(Colors.white)
                            Image("hero-image")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(16)
                        }
                    }
                }
                .padding()
                .background(Colors.primaryOne)
                
                                
                VStack{
                    VStack{
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("Name", text: $firstName)
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
                        HStack {
                            Image(systemName: "phone")
                                .foregroundColor(.gray)
                            TextField("Phone Number", text: $phoneNumber).keyboardType(.phonePad)
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
