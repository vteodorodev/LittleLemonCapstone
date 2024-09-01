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
    @State var firstName: String = "aa"
    @State var lastName: String = "bb"
    @State var email: String = "AA@bb.com"
    
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
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("E-Mail", text: $email)
                Button(action: onPressRegister) {
                    Text("Register")
                }
            }.onAppear {
                onAppearOnboarding()
            }

        }
    }
}

#Preview {
    Onboarding()
}
