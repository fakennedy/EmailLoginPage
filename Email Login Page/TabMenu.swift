//
//  TabMenu.swift
//  Email Login Page
//
//  Created by Izzie Watts on 21/09/2021.
//


//Very simple tab menu bar for bottom menu

import SwiftUI

struct TabMenu: View {
    var body: some View {
        TabView{
            RedView()
            .tabItem{
                Image(systemName: "phone.fill")
                Text("First Tab")
            }
        BlueView()
            .tabItem{
                Image(systemName: "tv.fill")
                Text("Second Tab")
                
            }
        }
    }
}

struct RedView: View{
    var body: some View{
        Color.red
    }
}

struct BlueView: View {
    var body: some View{
        OpeningView()
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
