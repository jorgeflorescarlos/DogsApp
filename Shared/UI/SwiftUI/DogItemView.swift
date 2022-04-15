//
//  DogItemView.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 11/04/22.
//

import SwiftUI

struct DogItemView: View {
    
    let dog: Dog
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom,spacing: 0.0) {
                AsyncImage(url: URL(string: dog.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geo.size.width * 0.37, height: 210)
                .cornerRadius(10.0)
                .clipped()
                .zIndex(1)
                
                SwiftUIDogCardView(dog: dog)
                    .frame(width: geo.size.width * 0.6, height: nil)
                
            }
        }
    }
    
}

struct DogItemView_Previews: PreviewProvider {
    static var previews: some View {
        DogItemView(dog: Dog(id: UUID().uuidString, name: "Cheems", description: "Best internet dog", age: 1, image: "https://i.pinimg.com/736x/a3/80/86/a3808660fcf50b7602e15c6a8ca6c469.jpg"))
            .previewLayout(.fixed(width: 300, height: 210))
    }
}
