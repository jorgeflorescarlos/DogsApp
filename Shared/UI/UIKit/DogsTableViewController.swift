//
//  DogsTableViewController.swift
//  DogsApp (iOS)
//
//  Created by Jorge Flores Carlos on 14/04/22.
//

import UIKit
import SwiftUI

struct DogsTableView: UIViewRepresentable {
    
    @StateObject var vm:  DogListViewModel
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.register(DogTableViewCell.nib, forCellReuseIdentifier: DogTableViewCell.identifier)
        return tableView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        if vm.dogs.count == 0 {
            Task{
                await vm.getDogs()
                context.coordinator.data = vm.dogs
                uiView.backgroundColor = .clear
                uiView.reloadData()
            }
        }
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        var data: Dogs = []
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            data.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 240
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.identifier, for: indexPath) as! DogTableViewCell
            cell.configure(with: data[indexPath.row])
            return cell
        }
    }
}

