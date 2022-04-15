//
//  SwiftUIDogsList.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 12/04/22.
//

import SwiftUI

struct DogListView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @StateObject var vm:  DogListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
#if os(macOS)
                TitleView()
#endif
                ForEach(vm.dogs) {dog in
                    DogItemView(dog: dog)
                        .frame(width: nil, height: 240, alignment: .center)
                        .clipped()
                        .shadow(color: Color(hexString: "\(Constants.Colors.secondColor)02")!, radius: 2, x: 5, y: 5)
                }
            }.task {
                await vm.getDogs()
            }
            .padding(.horizontal,20)
        }
#if !os(macOS)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
#endif
#if !os(macOS)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    
                    
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(hexString: Constants.Colors.secondColor))
                    
                }
            }
            ToolbarItem(placement: .principal){
                TitleView()
            }
        }
#endif
        .background(Color(hexString: Constants.Colors.thirdColor))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
            
        }))
        
        
    }
}

struct SwiftUIDogsList_Previews: PreviewProvider {
    static var previews: some View {
        DogListView(vm: DogListViewModel(persistenceType: .CoreData))
    }
}
