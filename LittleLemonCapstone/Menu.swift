//
//  Menu.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Menu: View {
        
    func getMenuData () {
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let request = URL(string: urlString)!
        let urlSession = URLSession.shared
        
    
        let task = urlSession.dataTask(with: request) { data, response, error in
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let fullMenu = try jsonDecoder.decode(JSONMenu.self, from: data).menu
                    print(fullMenu)
                    
                } catch {
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
    
    
    var body: some View {
        VStack {
            Text("Little Lemon Menu")
            Text("Chicago")
            Text("Order your favorite items and get them at your doorstep")
        }.onAppear {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}
