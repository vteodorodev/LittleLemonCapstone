//
//  Logo.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 01/09/2024.
//

import SwiftUI

struct SmallLogo: View {
    var body: some View {
        Image("small-logo").resizable()
            .aspectRatio(contentMode: .fit)

    }
}

#Preview {
    SmallLogo()
}
