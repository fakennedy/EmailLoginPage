//
//  SideMenuHeaderView.swift
//  TestApp
//
//  Created by Fintan Kennedy on 03/08/2021.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding  var isShowing: Bool
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            //Exit button
            Button(action: {withAnimation(.spring()){
                isShowing.toggle()
            }}, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            
            VStack(alignment: .leading) {
                Image("Beach")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Fintan Kennedy")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("@Beach")
                    .font(.system(size: 14))
                    .padding(.bottom, 24) //Push followers lower
                
                //seperate HStacks allows elements to be seperate
                HStack(spacing: 12){
                    HStack(spacing: 4){
                        Text("1,254").bold()
                        Text("Following")
                    }
                    HStack(spacing: 4){
                        Text("607").bold()
                        Text("Followers")
                    }
                    Spacer()
                }
                
                Spacer() //VStack spacer
            }.foregroundColor(.white)
            .padding()
        }
        
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
