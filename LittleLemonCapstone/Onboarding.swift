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
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
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
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Colors.primaryOne)
                
                                
                VStack(spacing: 30){
                    VStack(spacing: 15){
                        VStack(alignment: .leading, spacing: 5) {
                            Text("First Name*")
                                .font(.karlaLabel)
                                .foregroundStyle(Color.primary1)
                            TextField("First Name", text: $firstName)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary1, lineWidth:1))
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Last Name*")
                                .font(.karlaLabel)
                                .foregroundStyle(Color.primary1)
                            TextField("Last Name", text: $lastName)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary1, lineWidth:1))
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("Email*")
                                .font(.karlaLabel)
                                .foregroundStyle(Color.primary1)
                            TextField("Email", text: $email)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary1, lineWidth:1))
                        }
                        

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
