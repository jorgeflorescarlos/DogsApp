//
//  ContentView.swift
//  Shared
//
//  Created by Jorge Flores Carlos on 11/04/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    private let displayTypes = DisplayTypes.allCases
    
    init() {
        setNavigationBarStyle()
    }
    
    fileprivate func setNavigationBarStyle() {
#if !os(macOS)
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(hexString: Constants.Colors.thirdColor)
        coloredAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
#endif
    }
    let numbers = Array(0...10)
    
    var body: some View {
        NavigationView {
            List {
                Text("Select a version of dogs viewer")
                    .font(.caption)
                    .disabled(true)
                ForEach(displayTypes, id: \.self) { displayType in
                    NavigationLink() {
                        switch displayType {
                        case .SwiftUICoreData:
                            DogListView(vm: DogListViewModel(persistenceType: .CoreData))
                        case .SwiftUIRealm:
                            DogListView(vm: DogListViewModel(persistenceType: .Realm))
                        case .UIkitKitCoreData:
                            DogsTableView(vm: DogListViewModel(persistenceType: .CoreData)).background(Color(hexString: Constants.Colors.thirdColor))
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar {
                                    ToolbarItem(placement: .principal){
                                        TitleView()
                                    }
                                }
                        case .UIKitRealm:
                            DogsTableView(vm: DogListViewModel(persistenceType: .Realm)).background(Color(hexString: Constants.Colors.thirdColor))
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar {
                                    ToolbarItem(placement: .principal){
                                        TitleView()
                                    }
                                }
                        }
                        
                    } label: {
                        Text(displayType.rawValue)
                    }
                }
            }
            .navigationTitle("Dogs Viewer")
#if !os(macOS)
            .navigationBarTitleDisplayMode(.large)
#endif
            Text("Select a view")
        }
        .navigationTitle("Dogs Viewer")
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
