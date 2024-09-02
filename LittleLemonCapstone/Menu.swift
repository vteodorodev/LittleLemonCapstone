//
//  Menu.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
        
    func getMenuData () {
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let request = URL(string: urlString)!
        let urlSession = URLSession.shared
        
        PersistenceController.shared.clear()
        
    
        let task = urlSession.dataTask(with: request) { data, response, error in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                do {
                    let fullMenu = try jsonDecoder.decode(JSONMenu.self, from: data).menu
                    fullMenu.forEach { item in
                        let dish = Dish(context: viewContext)
                        dish.id = Int64(item.id)
                        dish.title = item.title
                        dish.price = item.price
                        dish.image = item.image
                        
                    }
                    
                    try viewContext.save()
                    
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
            FetchedObjects() { (dishes: [Dish]) in
                List {
                    ForEach(dishes) {
                        dish in
                        MenuItemView(title: dish.title, formattedPrice: dish.formatPrice(), image: dish.image)
                    }
                }
            }
        }.onAppear {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}
