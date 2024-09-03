//
//  Menu.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 18/07/2024.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    @State var selectedCategory = "all"
    
    func buildSortDescriptors() -> [NSSortDescriptor]  {
        
        let sortDescriptor = NSSortDescriptor(
            key: "title",
            ascending: true,
            selector: #selector(NSString .localizedStandardCompare))
        
        return [sortDescriptor]
    }
    
    func buildPredicate() -> NSPredicate {
        var searchPredicate : NSPredicate
        var categoryPredicate = NSPredicate(value: true)
        if searchText.isEmpty {
            searchPredicate = NSPredicate(value: true)
        } else {
            searchPredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        if (selectedCategory) != "all" {
            categoryPredicate = NSPredicate(format: "category LIKE[cd] %@", selectedCategory)
        }
                
        return NSCompoundPredicate(type: .and, subpredicates: [categoryPredicate, searchPredicate])
    }
    
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
                        dish.dishDescription = item.dishDescription
                        dish.category = item.category
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
        
        VStack(alignment:.leading) {
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
                            .frame(height: 140)
                        Image("hero-image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipped()
                            .cornerRadius(16)
                    }
                }
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search menu", text: $searchText)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                .background(Colors.white)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                )
            }
            .padding()
            .background(Colors.primaryOne)
            
            VStack(alignment: .leading) {
                Text("ORDER FOR DELIVERY!").font(.karlaSection)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(["all","starters", "mains", "desserts", "drinks"], id: \.self) {category in
                            Text(category.capitalized)
                                .font(.karlaCategory)
                                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                                .background(Colors.white)
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    )
                                )
                                .onTapGesture {
                                    selectedCategory = category
                                }

                        }
                    }
                }
            }.padding()
            
            Divider()
                        
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) {
                            dish in
                            MenuItemView(title: dish.title, formattedPrice: dish.formatPrice(), image: dish.image, dishDescription: dish.dishDescription)
                        }
                    }.listStyle(.plain)
                }
        }.onAppear {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}
