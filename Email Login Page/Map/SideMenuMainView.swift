//
//  SideMenuMainView.swift
//  SideMenuSwiftUITutorial
//
//  Created by Fintan Kennedy on 03/08/2021.
//

import SwiftUI

struct SideMenuMainView: View {
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    //move rest of page when menu button is pressed
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .ignoresSafeArea()
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }))
                    
                    .navigationTitle("Home")
            }
            //send back to home menu
            //onAppear{
                //isShowing = false
            //}
        }
    }
}

struct SideMenuMainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(.white)
             
            Text("Hello, world!")
                .padding()
        }
        
    }
}
