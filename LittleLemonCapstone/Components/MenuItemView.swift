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
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Text(formattedPrice)
            }
            
            AsyncImage(url: URL(string: image)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().frame(maxWidth: .infinity, maxHeight: 200)
                default: ProgressView() // <-- here
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
    MenuItemView(title: "Title", formattedPrice: "$0.99", image: "")
}
