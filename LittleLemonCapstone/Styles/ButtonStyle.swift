//
//  CustomButton.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 01/09/2024.
//

import SwiftUI

struct YellowButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Colors.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Colors.primaryTwo, lineWidth: 2)
                )
            .background(Colors.primaryTwo)
                .cornerRadius(15)
    }
}
