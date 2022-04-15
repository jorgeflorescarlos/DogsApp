//
//  TitleView.swift
//  DogsApp (iOS)
//
//  Created by Jorge Flores Carlos on 15/04/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Dogs We Love")
            .font(
                .system(
                    size: 26,
                    weight: .regular,
                    design: .default)
            )
            .foregroundColor(Color(hexString: Constants.Colors.secondColor))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
