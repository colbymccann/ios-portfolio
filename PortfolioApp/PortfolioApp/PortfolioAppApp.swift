//
//  PortfolioAppApp.swift
//  PortfolioApp
//
//  Created by Colby McCann on 4/26/24.
//

import SwiftUI

@main
struct PortfolioAppApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView{
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
