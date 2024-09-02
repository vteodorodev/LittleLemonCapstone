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
                
                
                Image("full-logo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300, alignment: .center)
                                
                VStack{
                    VStack{
                        TextField("First Name", text: $firstName)
                            .frame(minHeight: 50)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Colors.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1.0)
                                    .fill(Colors.primaryOne)
                            )
                        TextField("Last Name", text: $lastName)
                            .frame(minHeight: 50)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Colors.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1.0)
                                    .fill(Colors.primaryOne)
                            )
                        TextField("E-Mail", text: $email)
                            .frame(minHeight: 50)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Colors.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1.0)
                                    .fill(Colors.primaryOne)
                            )
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    Button(action: onPressRegister) {
                        Text("Register")
                    }.buttonStyle(YellowButton())
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
