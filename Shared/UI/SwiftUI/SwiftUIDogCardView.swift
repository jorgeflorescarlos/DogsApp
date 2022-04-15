//
//  SwiftUIDogCardView.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 12/04/22.
//

import SwiftUI

struct SwiftUIDogCardView: View {
    let dog: Dog
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                .fill(.white)
                .padding(.leading, -10)
            VStack(alignment: .leading, spacing: 10) {
                Text(dog.name)
                    .font(.title)
                    .foregroundColor(Color(hexString: Constants.Colors.secondColor))
                    .padding(.top, 15)
                
                Text(dog.description)
                    .font(.subheadline)
                    .foregroundColor(Color(hexString: Constants.Colors.mainColor))
                Text("\(dog.age) years")
                    .font(.footnote)
                    .foregroundColor(Color(hexString: Constants.Colors.secondColor))
                Spacer()
            }
            .padding(.horizontal, 20)
            .clipped()
            .multilineTextAlignment(.leading)
        }
        .padding(0)
        .padding(.top, 60)}
    
}

struct SwiftUIDogCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDogCardView(dog: Dog(id: UUID().uuidString, name: "Cheems", description: "Best internet dog", age: 1, image: "https://i.pinimg.com/736x/a3/80/86/a3808660fcf50b7602e15c6a8ca6c469.jpg"))
        
    }
}
