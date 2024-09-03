//
//  MenuItemView.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 02/09/2024.
//

import SwiftUI

struct MenuItemView: View {
    
    let title: String
    let formattedPrice: String
    let image: String
    let dishDescription: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title).font(.karlaCardTitle)
            HStack(spacing:0){
                VStack (alignment: .leading, spacing: 0){
                    Text(dishDescription)
                        .lineLimit(4)
                        .font(.karlaParagraph)
                        .foregroundStyle(Colors.primaryOne)
                    Spacer()
                    Text(formattedPrice).font(.karlaHighlight).foregroundStyle(Colors.primaryOne)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                
                AsyncImage(url: URL(string: image)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipped()
                    default: ProgressView().frame(width: 140, height: 140) // <-- here
                    }
                }
            }
            
            
            
            
            
        }
        
        
        /* HStack {
         Text(title)
         Spacer()
         Text(formattedPrice)
         }
         AsyncImage(url: URL(string: image)) { image in
         image.resizable()
         } placeholder: {
         ProgressView()
         }
         .frame(width: 200, height: 200) */
    }
}

#Preview {
    MenuItemView(title: "Greek Salad", formattedPrice: "$10", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true", dishDescription: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.")
}
